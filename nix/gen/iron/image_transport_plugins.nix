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
        rev = "9b5f3aa0f5a23596914d8d4f278175c3ac0476a3";
        hash = "sha256-aZe17RNQTupulDgQd2eJ5pJci2Xl0qahtVHS7esBTJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_transport_plugins";
  version = "3.1.0-1";
  src = sources.image_transport_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ compressed_depth_image_transport compressed_image_transport theora_image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
