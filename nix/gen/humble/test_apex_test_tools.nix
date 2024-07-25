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
        rev = "71e368087972b09b0749b6889f598503fd122e2e";
        hash = "sha256-ZB2lhFknuQ+9fA1s+tCKrhHEUOnSLF2ogSsE0tVMrjE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "test_apex_test_tools";
  version = "0.0.2-6";
  src = sources.test_apex_test_tools;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
