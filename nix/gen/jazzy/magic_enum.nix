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
    magic_enum = substituteSource {
      src = fetchgit {
        name = "magic_enum-source";
        url = "https://github.com/ros2-gbp/magic_enum-release.git";
        rev = "795fc2fd62c047e4282c49aa9a55d20fdab4eed7";
        hash = "sha256-UM1GrwIoe4ScsiC1IhCSqgRqsh3PwDk62bt78smr1rs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "magic_enum";
  version = "0.9.5-3";
  src = sources.magic_enum;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
