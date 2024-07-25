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
        rev = "9c772d1d16a12bb92f0fb7c9658793c2b912f8cf";
        hash = "sha256-+mE+NkGEuPh8fHQwcx0MX0DYlVwGrbAGCbKply1Zrmg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "menge_vendor";
  version = "1.0.1-1";
  src = sources.menge_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
