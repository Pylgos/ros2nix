{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    sick_safetyscanners_base = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners_base-source";
        url = "https://github.com/SICKAG/sick_safetyscanners_base-release.git";
        rev = "cb078cc4bfc9bd39fd557421e851799d4c07e4db";
        hash = "sha256-L5mOmHZbzAUgiusdWoORLFj9p10N8/yCVxxs38YM8sw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners_base";
  version = "1.0.2-1";
  src = sources.sick_safetyscanners_base;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
