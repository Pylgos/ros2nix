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
        rev = "449c64364b22de9b8e4cd4232c8b99d55b545586";
        hash = "sha256-LImoXUW1Wa2lVaSpwFoBuSMk83yHi40nWrPITzg27SY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_image_transport";
  version = "4.0.0-2";
  src = sources.compressed_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
