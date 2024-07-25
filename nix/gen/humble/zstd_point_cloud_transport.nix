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
  zstd,
}:
let
  sources = rec {
    zstd_point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "zstd_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "b4340554ca0853c14e1523970c7781e4979c50ea";
        hash = "sha256-b5hFxW3Sr0mtf0qME6SHJQNmty4UPq7f91ghkno9kZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_point_cloud_transport";
  version = "1.0.11-1";
  src = sources.zstd_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
