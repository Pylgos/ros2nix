{
  ament_cmake,
  buildRosPackage,
  curl,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gtest,
  jsoncpp,
  launch,
  launch_ros,
  ouster_msgs,
  pcl,
  pcl_conversions,
  pcl_ros,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  spdlog,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
}:
let
  sources = rec {
    ouster_ros = substituteSource {
      src = fetchgit {
        name = "ouster_ros-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "ad98e0ea73fae7ac2d5137f58d51393c8aaefcfa";
        hash = "sha256-6AvZWyphDfTsZSzNYo9CDFPzaw2IPh1dbA0KXVoQ0KI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_ros";
  version = "0.10.4-1";
  src = sources.ouster_ros;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ curl launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs jsoncpp launch_ros ouster_msgs pcl pcl_conversions pcl_ros rclcpp rclcpp_components rclcpp_lifecycle rosidl_default_runtime sensor_msgs spdlog std_msgs std_srvs tf2_eigen tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
