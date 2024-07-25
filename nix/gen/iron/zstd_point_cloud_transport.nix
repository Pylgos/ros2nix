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
        rev = "5d26a50dbb9d754df4db07ca3490df23d16db36e";
        hash = "sha256-SpQbl71bbykG593sCaKR2c59EGsy9bjzHsLUBxrEYCY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_point_cloud_transport";
  version = "2.0.5-1";
  src = sources.zstd_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
