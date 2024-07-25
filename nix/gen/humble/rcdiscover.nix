{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rcdiscover = substituteSource {
      src = fetchgit {
        name = "rcdiscover-source";
        url = "https://github.com/ros2-gbp/rcdiscover-release.git";
        rev = "040a6f86e0390bd6c362136d4868c3b1a4c5532f";
        hash = "sha256-73zdM/PrKUp1+z2vYAMcS/HmKLsquerS/2z/1IVNlao=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcdiscover";
  version = "1.1.6-1";
  src = sources.rcdiscover;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
