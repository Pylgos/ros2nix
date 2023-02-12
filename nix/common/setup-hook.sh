# shellcheck shell=bash
if [[ -z "${ros2nix_setup_hook_has_run-}" || @isShellHook@ ]]; then
ros2nix_setup_hook_has_run=1


_colcon_prefix_sh_prepend_unique_value() {
  # arguments
  _listname="$1"
  _value="$2"

  # get values from variable
  eval _values=\"\$$_listname\"
  # backup the field separator
  _colcon_prefix_sh_prepend_unique_value_IFS="$IFS"
  IFS=":"
  # start with the new value
  _all_values="$_value"
  _contained_value=""
  # iterate over existing values in the variable
  for _item in $_values; do
    # ignore empty strings
    if [ -z "$_item" ]; then
      continue
    fi
    # ignore duplicates of _value
    if [ "$_item" = "$_value" ]; then
      _contained_value=1
      continue
    fi
    # keep non-duplicate values
    _all_values="$_all_values:$_item"
  done
  unset _item
  if [ -z "$_contained_value" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      if [ "$_all_values" = "$_value" ]; then
        echo "export $_listname=$_value"
      else
        echo "export $_listname=$_value:\$$_listname"
      fi
    fi
  fi
  unset _contained_value
  # restore the field separator
  IFS="$_colcon_prefix_sh_prepend_unique_value_IFS"
  unset _colcon_prefix_sh_prepend_unique_value_IFS
  # export the updated variable
  eval export $_listname=\"$_all_values\"
  unset _all_values
  unset _values

  unset _value
  unset _listname
}

declare -a deps=("${depsBuildBuildPropagated[@]}")
deps+=("${propagatedNativeBuildInputs[@]}")
deps+=("${depsBuildTargetPropagated[@]}")
deps+=("${depsHostHostPropagated[@]}")
deps+=("${propagatedBuildInputs[@]}")
deps+=("${depsTargetTargetPropagated[@]}")
deps+=("${depsBuildBuild[@]}")
deps+=("${nativeBuildInputs[@]}")
deps+=("${depsBuildTarget[@]}")
deps+=("${depsHostHost[@]}")
deps+=("${buildInputs[@]}")
deps+=("${depsTargetTarget[@]}")

set +u

if [[ ! -z $ROS2NIX_SETUP_VERBOSE ]]; then
  echo executing @setupHelper@ "${deps[@]}"
fi
source <(@setupHelper@ "${deps[@]}")

set -u

fi