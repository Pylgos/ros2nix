{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_dbw_common,
  dataspeed_ulc_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclpy,
  ros_testing,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_ulc_can = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "2b7f30f8318df10acc541f3bda677e7fd5eba344";
        hash = "sha256-ctLfCDP8Fllls/tcmUBZIjl489K/e0xuU+5uPQeb0Pk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_ulc_can";
  version = "2.1.16-1";
  src = sources.dataspeed_ulc_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_dbw_common dataspeed_ulc_msgs geometry_msgs rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
