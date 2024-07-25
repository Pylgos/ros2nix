{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    velodyne_laserscan = substituteSource {
      src = fetchgit {
        name = "velodyne_laserscan-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "08635547f950fb47f150327ec5eb287e6c105278";
        hash = "sha256-rSKlfJVrsBMOdfguEVxqRmL3bNJiRLJsyy6iTcxdfKY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_laserscan";
  version = "2.3.0-3";
  src = sources.velodyne_laserscan;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
