{
  ament_cmake,
  buildRosPackage,
  clearpath_control,
  clearpath_description,
  clearpath_generator_common,
  clearpath_platform,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    clearpath_common = substituteSource {
      src = fetchgit {
        name = "clearpath_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "dce277c9faea45e84eb88c719d92e0b120c90ada";
        hash = "sha256-OOFEnlKFWwIooCXZ4fkcbQMkfj2bbwhh5gQtIDYUTFE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_common";
  version = "0.2.9-1";
  src = sources.clearpath_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_control clearpath_description clearpath_generator_common clearpath_platform ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
