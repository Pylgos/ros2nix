{
  ament_cmake_auto,
  ament_lint_auto,
  apex_test_tools,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    test_apex_test_tools = substituteSource {
      src = fetchgit {
        name = "test_apex_test_tools-source";
        url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
        rev = "41548b847199c9ba278cb21f89a49366de08509a";
        hash = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_apex_test_tools";
  version = "0.0.2-8";
  src = sources.test_apex_test_tools;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
