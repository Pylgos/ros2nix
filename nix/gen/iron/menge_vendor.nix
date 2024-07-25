{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  substituteSource,
  tinyxml,
}:
let
  sources = rec {
    menge_vendor = substituteSource {
      src = fetchgit {
        name = "menge_vendor-source";
        url = "https://github.com/ros2-gbp/menge_vendor-release.git";
        rev = "9c452a49e4d306a6020ad36e8fa0f199455ece82";
        hash = "sha256-eVfgAS2uHARNKkSaJ+XeVKht1GxaljrlzINMUXv3v6A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "menge_vendor";
  version = "1.1.1-1";
  src = sources.menge_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
