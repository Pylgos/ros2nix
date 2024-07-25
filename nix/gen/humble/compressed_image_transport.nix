{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    compressed_image_transport = substituteSource {
      src = fetchgit {
        name = "compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "6b478693757f4ffb987386e9fde0ecd8d34c60d9";
        hash = "sha256-C9SvkTysXYhEcfniW0QFGInXc8gHZx0pIHeTXnMEp2s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_image_transport";
  version = "2.5.1-1";
  src = sources.compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
