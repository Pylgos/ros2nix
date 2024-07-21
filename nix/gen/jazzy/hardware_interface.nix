{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_limits,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  rcpputils,
  rcutils,
  ros2_control_test_assets,
  substituteSource,
  tinyxml2_vendor,
  urdf,
}:
let
  sources = rec {
    hardware_interface = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "89e4aea82db4472115c5992e269fc23d3599a9b4";
        hash = "sha256-76VKdicTIO18oZS9CMhddTxTXs5qbLZhMjgHsuGzAQ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface";
  version = "4.11.0-1";
  src = sources.hardware_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs joint_limits lifecycle_msgs pluginlib rclcpp_lifecycle rcpputils rcutils tinyxml2_vendor urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
