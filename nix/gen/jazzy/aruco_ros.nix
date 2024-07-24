{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  aruco,
  aruco_msgs,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  image_transport,
  rclcpp,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    aruco_ros = substituteSource {
      src = fetchgit {
        name = "aruco_ros-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "6a254acadd05ba78a14ddb800009dd556ab09508";
        hash = "sha256-LIF5MiASkw9eXs5hNg5L1VAmICC588FpCYYSOHAjZjU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_ros";
  version = "5.0.5-1";
  src = sources.aruco_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ aruco aruco_msgs cv_bridge geometry_msgs image_transport rclcpp sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
