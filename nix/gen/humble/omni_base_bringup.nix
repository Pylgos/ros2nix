{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_linux,
  joy_teleop,
  launch_pal,
  omni_base_controller_configuration,
  omni_base_description,
  robot_state_publisher,
  substituteSource,
  twist_mux,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_bringup = substituteSource {
      src = fetchgit {
        name = "omni_base_bringup-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "5d907ded56a207e439ba0a9be577e1a4ec263b9c";
        hash = "sha256-Ar3gYOaWphZ1UbdPMk6AtZby0BPdg08U6mBayVmnycQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_bringup";
  version = "2.0.18-1";
  src = sources.omni_base_bringup;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy_linux joy_teleop launch_pal omni_base_controller_configuration omni_base_description robot_state_publisher twist_mux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
