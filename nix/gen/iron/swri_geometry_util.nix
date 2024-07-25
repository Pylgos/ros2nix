{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geos,
  pkg-config,
  rclcpp,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    swri_geometry_util = substituteSource {
      src = fetchgit {
        name = "swri_geometry_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "97dd4360ce70e9620df662a9e57010de6914d864";
        hash = "sha256-pz0GY5aY3hNn41PVQt01Ea+WrC/WQ0v6js4IpDasC0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_geometry_util";
  version = "3.6.1-1";
  src = sources.swri_geometry_util;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge eigen geos rclcpp tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}