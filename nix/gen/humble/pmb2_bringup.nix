{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  joy_linux,
  joy_teleop,
  launch_pal,
  pmb2_controller_configuration,
  pmb2_description,
  robot_state_publisher,
  substituteSource,
  twist_mux,
  twist_mux_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_bringup = substituteSource {
      src = fetchgit {
        name = "pmb2_bringup-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "ec0f8c62af46bdfc5043a015e5fcf8ba028a836c";
        hash = "sha256-TIhGISyNBh87/ckSTJUBTAvPUULgQIMLJwAo0EM7RAo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_bringup";
  version = "5.0.25-1";
  src = sources.pmb2_bringup;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy_linux joy_teleop launch_pal pmb2_controller_configuration pmb2_description robot_state_publisher twist_mux twist_mux_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
