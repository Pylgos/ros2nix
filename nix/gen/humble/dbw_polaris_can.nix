{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  dataspeed_dbw_common,
  dataspeed_ulc_can,
  dbw_polaris_description,
  dbw_polaris_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dbw_polaris_can = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "04ee053010e0339edf1ad9d46497ba046097bc9c";
        hash = "sha256-Ai6XqQv0d4IiPNJyw1FoqLmDWDGCF3HfgrzHXI/kGOQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_polaris_can";
  version = "2.1.16-1";
  src = sources.dbw_polaris_can;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_can_msg_filters dataspeed_can_usb dataspeed_dbw_common dataspeed_ulc_can dbw_polaris_description dbw_polaris_msgs geometry_msgs rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
