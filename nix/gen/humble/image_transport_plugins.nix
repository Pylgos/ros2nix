{
  ament_cmake,
  buildRosPackage,
  compressed_depth_image_transport,
  compressed_image_transport,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  theora_image_transport,
}:
let
  sources = rec {
    image_transport_plugins = substituteSource {
      src = fetchgit {
        name = "image_transport_plugins-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "de779443241226b825be1fdce2c53c3bf1688c7e";
        hash = "sha256-StXDEpVD3MSorcbUG4OVFDT2L6i6DTjyezdr+O8+EV4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport_plugins";
  version = "2.5.1-1";
  src = sources.image_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ compressed_depth_image_transport compressed_image_transport theora_image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
