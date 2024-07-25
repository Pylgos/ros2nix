{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  marti_nav_msgs,
  python3Packages,
  rclcpp,
  substituteSource,
  swri_geometry_util,
  swri_math_util,
  swri_roscpp,
  swri_transform_util,
  tf2_geometry_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    swri_route_util = substituteSource {
      src = fetchgit {
        name = "swri_route_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "cbaf1315f74da3ca08b055f6b88f0065120e7735";
        hash = "sha256-Opkx5/etJwnlusBl9vZeMF+M5msxpehmC4Cykze1gTQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_route_util";
  version = "3.6.1-1";
  src = sources.swri_route_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ marti_common_msgs marti_nav_msgs python3Packages.boost rclcpp swri_geometry_util swri_math_util swri_roscpp swri_transform_util tf2_geometry_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}