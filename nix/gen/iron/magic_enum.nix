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
        rev = "69a3551539cdc430ad165e4deda32da2997ec353";
        hash = "sha256-8wxfY8E3e0N4H5oNzjigQkGgoopJYAD7kuocsCGQlM4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "magic_enum";
  version = "0.9.5-1";
  src = sources.magic_enum;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
