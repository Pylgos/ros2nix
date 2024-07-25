{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    mocap_optitrack = substituteSource {
      src = fetchgit {
        name = "mocap_optitrack-source";
        url = "https://github.com/ros2-gbp/mocap_optitrack-release.git";
        rev = "1d28c463ecb3cead2427601914d46376e0933753";
        hash = "sha256-xxRA4j0e0hgT4dFBzoXf4il5je2z/palqK9W8Knf/qs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap_optitrack";
  version = "1.0.0-3";
  src = sources.mocap_optitrack;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
