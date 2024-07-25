{
  ament_cmake_gtest,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros2_socketcan,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_dbw_common = substituteSource {
      src = fetchgit {
        name = "dataspeed_dbw_common-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "f6e65048b1f1d9158c07823bc2d09505ed5b024b";
        hash = "sha256-GAUFEZjUbp2vArMBY6U+ZiNCslm+AnDpmZa8GpM8eaM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_dbw_common";
  version = "2.1.16-1";
  src = sources.dataspeed_dbw_common;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ros2_socketcan ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
