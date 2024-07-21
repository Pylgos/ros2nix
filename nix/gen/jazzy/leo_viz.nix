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
}:
let
  sources = rec {
    leo_viz = substituteSource {
      src = fetchgit {
        name = "leo_viz-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "8a2ac2489016316dbf3b188848e424ab9c664891";
        hash = "sha256-JrS6oiobEEu7mNXfAH7Ayk6hIbPY0ldoaaA3B4v78iI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_viz";
  version = "3.0.0-3";
  src = sources.leo_viz;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui leo_description rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
