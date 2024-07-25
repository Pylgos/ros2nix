{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw_can = substituteSource {
      src = fetchgit {
        name = "ds_dbw_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "92c3304a3e795cdb6080783ea966a98dec2a4d6b";
        hash = "sha256-DI0MoFEyPpJ0WNpwwlMep+AAVzrJt6HNSwAjkz/KD5Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_can";
  version = "2.1.16-1";
  src = sources.ds_dbw_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_can_msg_filters dataspeed_can_usb ds_dbw_msgs rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
