{
  makeSetupHook,
  ros-setup-helper,
  bash,
  writeScript,
}:

makeSetupHook
  {
    name = "ros-setup-hook";
    substitutions = {
      shell = "${bash}/bin/bash";
      setupHelper = "${ros-setup-helper}/bin/setup-helper";
    };
  }
  (
    writeScript "run-hello-hook.sh" ''
      #!@shell@

      ros2nixSetupHook_addSerchPath() {
        addToSearchPath _ROS2NIX_SEARCH_PATH "$1"
      }

      ros2nixSetupPhase() {
        source <(@setupHelper@)
      }

      addEnvHooks "$targetOffset" ros2nixSetupHook_addSerchPath

      prePhases+=(ros2nixSetupPhase)
    ''
  )
