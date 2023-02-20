# shellcheck shell=bash
if [[ -z "${__nix_wrapGLAppsHook-}" ]]; then
__nix_wrapGLAppsHook=1


assertExecutable() {
    local file="$1"
    [[ -f "$file" && -x "$file" ]] || \
        die "Cannot wrap '$file' because it is not an executable file"
}


wrapGLApp() {
    local prog="$1"
    local hidden

    assertExecutable "$prog"

    hidden="$(dirname "$prog")/.$(basename "$prog")"-wrapped
    while [ -e "$hidden" ]; do
      hidden="${hidden}_"
    done
    mv "$prog" "$hidden"

    {
        echo "#! @shell@ -e"
        echo "if type nixGL > /dev/null && [[ ! -d /run/opengl-driver ]]; then"
        echo exec -a '"$0"' nixGL \""$hidden"\" '"$@"'
        echo "else"
        echo exec -a '"$0"' \""$hidden"\" '"$@"'
        echo "fi"
    } >> "$prog"
    chmod +x "$prog"
}


wrapGLAppsHook() {
    # skip this hook when requested
    [ -z "${dontWrapGLApps-}" ] || return 0

    # guard against running multiple times (e.g. due to propagation)
    [ -z "$wrapGLAppsHookHasRun" ] || return 0
    wrapGLAppsHookHasRun=1

    local targetDirs=( "$prefix/bin" )
    targetDirs+=( "$prefix"/lib/*/ )
    echo "wrapping GL applications in " "${targetDirs[@]}"

    for targetDir in "${targetDirs[@]}"
    do
        [ -d "$targetDir" ] || continue

        find "$targetDir" ! -type d -executable -print0 | while IFS= read -r -d '' file
        do
            # ignore files with extensions and hidden files
            if [[ $(basename "$file") == *"."* ]]; then
                echo "skipping $file"
                continue
            fi 

            echo "wrapping $file"
            wrapGLApp "$file"
        done
    done
}

fixupOutputHooks+=(wrapGLAppsHook)

fi