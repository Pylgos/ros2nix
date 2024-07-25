{
  ament_cmake,
  buildRosPackage,
  draco_point_cloud_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  point_cloud_interfaces,
  substituteSource,
  zlib_point_cloud_transport,
  zstd_point_cloud_transport,
}:
let
  sources = rec {
    point_cloud_transport_plugins = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport_plugins-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "91e2701e5599ae86fd75fe7ccf7ef6ae29fac3a4";
        hash = "sha256-PZRhJX5yL8ADynKuS/KprxWSHPMzewIUtaBVTxgp8Fw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_plugins";
  version = "1.0.11-1";
  src = sources.point_cloud_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ draco_point_cloud_transport point_cloud_interfaces zlib_point_cloud_transport zstd_point_cloud_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
