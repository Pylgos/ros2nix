{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  dataspeed_dbw_common,
  dataspeed_ulc_can,
  dbw_fca_description,
  dbw_fca_msgs,
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
    dbw_fca_can = substituteSource {
      src = fetchgit {
        name = "dbw_fca_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "13bf18e8cd3d609ddd9be7f996bef609ffa07834";
        hash = "sha256-oJdhp6LpG45Qf9sPFTXRi9fji8GQxsODyov45mhr/dI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_fca_can";
  version = "2.1.16-1";
  src = sources.dbw_fca_can;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_can_msg_filters dataspeed_can_usb dataspeed_dbw_common dataspeed_ulc_can dbw_fca_description dbw_fca_msgs geometry_msgs rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
