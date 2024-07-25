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
        rev = "2ec71640ff7cea47aa987e285c05cf256d09fbc2";
        hash = "sha256-e8v7B2PYu5GF8CeKFLKzXWc4fTWrI7dS7huCFnqhPLU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "magic_enum";
  version = "0.9.5-2";
  src = sources.magic_enum;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
