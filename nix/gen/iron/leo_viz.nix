{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  leo_description,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_viz = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "059a0a1b3ea636f9b3696ac55577a96820da4d25";
        hash = "sha256-/Es728yX2U3rrka2L/njQjasxhjT3TGEIoft9T/FLa8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_viz";
  version = "2.0.0-1";
  src = sources.leo_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui leo_description rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
