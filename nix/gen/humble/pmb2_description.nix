{
  ament_cmake_auto,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  launch,
  launch_pal,
  launch_param_builder,
  launch_ros,
  launch_testing_ament_cmake,
  pal_urdf_utils,
  rviz2,
  substituteSource,
  urdf_test,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    pmb2_description = substituteSource {
      src = fetchgit {
        name = "pmb2_description-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "d3dabac0165ab370047952a7da6fb9648573cb8c";
        hash = "sha256-Dc1R4lIXUvJWbQwatDaC/Gy0lpsHmN6tKqrnMo+nI84=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_description";
  version = "5.0.25-1";
  src = sources.pmb2_description;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui launch_pal launch_param_builder launch_ros pal_urdf_utils rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
