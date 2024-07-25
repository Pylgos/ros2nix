{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_hey5_controller_configuration,
  pal_hey5_description,
  substituteSource,
}:
let
  sources = rec {
    pal_hey5 = substituteSource {
      src = fetchgit {
        name = "pal_hey5-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "e9afec192d8153e0152d266ad087870283824af0";
        hash = "sha256-CrP55HGP2DGZfglhSWd3bb9hSeLMkPLkausvbeBqH/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_hey5";
  version = "4.1.0-1";
  src = sources.pal_hey5;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_hey5_controller_configuration pal_hey5_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
