{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hri_msgs,
  opencv,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    hri = substituteSource {
      src = fetchgit {
        name = "hri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "c28ce89bc5685ed0cfa79464880fa9a18c852a77";
        hash = "sha256-iexExxx/4J76YqAGnuqvmy1bxyHO8cy4IgbI7hd4jr4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hri";
  version = "2.3.0-1";
  src = sources.hri;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge geometry_msgs hri_msgs opencv rclcpp rclcpp_lifecycle sensor_msgs std_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
