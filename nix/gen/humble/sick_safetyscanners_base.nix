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
        rev = "945be7904f71e57d667a1b895561c675c067546f";
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
