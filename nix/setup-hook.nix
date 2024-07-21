{
  makeSetupHook,
  ros-setup-helper,
  bash,
  writeScript,
}:

makeSetupHook
  {
    name = "ros2nix-setup-hook";
    substitutions = {
      shell = "${bash}/bin/bash";
      setupHelper = "${ros-setup-helper}/bin/setup-helper";
    };
  }
  (
    writeScript "ros2nix-setup-hook.sh" ''
      #!@shell@

      _ros2nixSetupHook_addSerchPath() {
        addToSearchPath _ROS2NIX_SEARCH_PATH "$1"
      }

      _ros2nixSetupHook_postHook() {
        local fake_complete
        if ! type complete > /dev/null 2>&1; then
          complete() {
            :
          }
          fake_complete=1
        fi
        source <(@setupHelper@)
        if [ -n "$fake_complete" ]; then
          unset -f complete
        fi
      }

      addEnvHooks "$targetOffset" _ros2nixSetupHook_addSerchPath
      addEnvHooks "$hostOffset" _ros2nixSetupHook_addSerchPath

      postHooks+=(_ros2nixSetupHook_postHook)
    ''
  )
