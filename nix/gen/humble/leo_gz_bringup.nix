{
  ament_cmake,
  ament_cmake_black,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_mypy,
  ament_cmake_xmllint,
  ament_index_python,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_gz_plugins,
  leo_gz_worlds,
  robot_state_publisher,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    leo_gz_bringup = substituteSource {
      src = fetchgit {
        name = "leo_gz_bringup-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "35d72eef6f776928053acfbeef594c101cf4b2a0";
        hash = "sha256-oI9II7ZfFwgNgBRR75RVrt8S35bD3X8XT2ofUOXt7cc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_bringup";
  version = "1.1.0-1";
  src = sources.leo_gz_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_description leo_gz_plugins leo_gz_worlds robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
