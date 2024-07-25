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
        rev = "3df9fc8392d29ad8b40ecbeb65449f737eaeb717";
        hash = "sha256-y8Bi7qvfqrZ3E+EjhaOnGL6XZUV2qG7tVD3EG0S45yk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zlib_point_cloud_transport";
  version = "1.0.11-1";
  src = sources.zlib_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
