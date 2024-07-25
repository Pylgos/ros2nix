{
  abseil-cpp,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  cartographer,
  cartographer_ros_msgs,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gflags,
  glog,
  gtest,
  launch,
  nav_msgs,
  pcl,
  pcl_conversions,
  python3Packages,
  rclcpp,
  robot_state_publisher,
  ros_environment,
  rosbag2_cpp,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_msgs,
  tf2_ros,
  urdf,
  visualization_msgs,
}:
let
  sources = rec {
    cartographer_ros = substituteSource {
      src = fetchgit {
        name = "cartographer_ros-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "220cc62d9b410d777c4bd483e9e4861e1a3325d7";
        hash = "sha256-VvGxCdcHPGbZC+Mp6BMa4qpdJ2eoz0PuoBvhe/6gtCE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_ros";
  version = "2.0.9003-2";
  src = sources.cartographer_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ gtest ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ abseil-cpp builtin_interfaces cartographer cartographer_ros_msgs eigen geometry_msgs gflags glog launch nav_msgs pcl pcl_conversions python3Packages.sphinx rclcpp robot_state_publisher rosbag2_cpp rosbag2_storage sensor_msgs std_msgs tf2 tf2_eigen tf2_msgs tf2_ros urdf visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
