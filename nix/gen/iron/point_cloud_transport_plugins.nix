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
        rev = "7fa1f6b7a7278bc6d0b8ca90a203be0f30bbd175";
        hash = "sha256-QgxNoOWtyewCyL+hPRozXIWm2PSra6XpUUDqvHABsu8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport_plugins";
  version = "2.0.5-1";
  src = sources.point_cloud_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ draco_point_cloud_transport point_cloud_interfaces zlib_point_cloud_transport zstd_point_cloud_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
