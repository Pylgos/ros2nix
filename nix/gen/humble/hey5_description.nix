{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    hey5_description = substituteSource {
      src = fetchgit {
        name = "hey5_description-source";
        url = "https://github.com/pal-gbp/hey5_description-release.git";
        rev = "19b64f032d024f198af590f9217fd2552e737909";
        hash = "sha256-fwL78XqHmvzyBGuSxeUljCaQjHZN3AYNgLJWfWvhBPQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hey5_description";
  version = "3.0.3-1";
  src = sources.hey5_description;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
