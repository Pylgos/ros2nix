{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    wall_follower_ros2 = substituteSource {
      src = fetchgit {
        name = "wall_follower_ros2-source";
        url = "https://github.com/ros2-gbp/wall_follower_ros2-release.git";
        rev = "9b37054f732ca90d4bab9b9a95daff86b8efc7b5";
        hash = "sha256-k6QeoS1adVKhLqSMvsChqqF4DYOb5O2Aa2tguZVwrio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wall_follower_ros2";
  version = "0.0.1-1";
  src = sources.wall_follower_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
