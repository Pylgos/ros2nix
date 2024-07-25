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
        rev = "06b9f093499101fba6c21720121b699e5b1a3736";
        hash = "sha256-hDnNI/WWXIDe7HqT8hJkYKVURW/4qNodZH7Hl/xcotw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcdiscover";
  version = "1.1.6-3";
  src = sources.rcdiscover;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
