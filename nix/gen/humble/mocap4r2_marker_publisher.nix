{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mocap4r2_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    mocap4r2_marker_publisher = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_publisher-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "4a00cbdea7206cadecd0bfdbe5c735e2458dd649";
        hash = "sha256-e2j4pswLnfH7hrhIK2VE6EWKvJw37YSlGyXZfKBxvfg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_marker_publisher";
  version = "0.0.7-1";
  src = sources.mocap4r2_marker_publisher;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mocap4r2_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
