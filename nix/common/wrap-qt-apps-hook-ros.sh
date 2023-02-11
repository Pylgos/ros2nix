if [[ -z "${__nix_wrapQtAppsHookRos-}" ]]; then
__nix_wrapQtAppsHookRos=1


wrapQtAppsHookRos() {
    # skip this hook when requested
    [ -z "${dontWrapQtAppsRos-}" ] || return 0

    # guard against running multiple times (e.g. due to propagation)
    [ -z "$wrapQtAppsHookRosHasRun" ] || return 0
    wrapQtAppsHookRosHasRun=1

    local targetDirs=( "$prefix/bin" )
    targetDirs+=( "$prefix"/lib/*/ )
    echo "wrapping Qt applications in ${targetDirs[@]}"

    for targetDir in "${targetDirs[@]}"
    do
        [ -d "$targetDir" ] || continue

        find "$targetDir" ! -type d -executable -print0 | while IFS= read -r -d '' file
        do
            # ignore files with extensions and hidden files
            if [[ $(basename file) == *"."* ]]; then
                echo "skipping $file"
                continue
            fi 

            if [ -f "$file" ]
            then
                echo "wrapping $file"
                wrapQtApp "$file"
            elif [ -h "$file" ]
            then
                target="$(readlink -e "$file")"
                echo "wrapping $file -> $target"
                rm "$file"
                makeQtWrapper "$target" "$file"
            fi
        done
    done
}

fixupOutputHooks+=(wrapQtAppsHookRos)

fi