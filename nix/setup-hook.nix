{ makeSetupHook, ros-setup-helper, bash, writeScript }:

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

      _setupRosHook() {
        source <(@setupHelper@)
      }

      preConfigureHooks+=(_setupRosHook)
    ''
  )
