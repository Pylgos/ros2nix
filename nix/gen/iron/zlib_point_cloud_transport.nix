{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_interfaces,
  point_cloud_transport,
  rclcpp,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    zlib_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "zlib_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "6da318e5a49fc9f7f51d5440a90b7dcb6aeddaf8";
        hash = "sha256-3XojuyNLRKWYO0d/+q4bkemD7elUQvSBkc7ii18wxn8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zlib_point_cloud_transport";
  version = "2.0.5-1";
  src = sources.zlib_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
