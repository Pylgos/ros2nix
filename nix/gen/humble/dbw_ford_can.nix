{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  dataspeed_dbw_common,
  dataspeed_ulc_can,
  dbw_ford_description,
  dbw_ford_msgs,
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
    dbw_ford_can = substituteSource {
      src = fetchgit {
        name = "dbw_ford_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "0b22af649e70f1c18662651a30f47d01149b761f";
        hash = "sha256-ibu88joHkvYhWwsQqUxQBJ3GF6EjZWD35QOohWgjyqI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_ford_can";
  version = "2.1.16-1";
  src = sources.dbw_ford_can;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_can_msg_filters dataspeed_can_usb dataspeed_dbw_common dataspeed_ulc_can dbw_ford_description dbw_ford_msgs geometry_msgs rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
