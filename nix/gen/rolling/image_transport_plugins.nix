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
  zstd_image_transport,
}:
let
  sources = rec {
    image_transport_plugins = substituteSource {
      src = fetchgit {
        name = "image_transport_plugins-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "c2634a40aa8c47b86692d57a89420c77a68e9add";
        hash = "sha256-YClB7oI9s8BJqKh1h9ZF6aw3uOgKo/ju81jmapjSYUc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport_plugins";
  version = "4.0.0-1";
  src = sources.image_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ compressed_depth_image_transport compressed_image_transport theora_image_transport zstd_image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
