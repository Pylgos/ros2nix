{
  ament_cmake,
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  apex_test_tools,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foonathan_memory_vendor,
  substituteSource,
}:
let
  sources = rec {
    apex_containers = substituteSource {
      src = fetchgit {
        name = "apex_containers-source";
        url = "https://github.com/ros2-gbp/apex_containers-release.git";
        rev = "377b63c3af9da61c7ee03a8275df1582270bf161";
        hash = "sha256-01lF2ZodmNGfazVwwxuHKPBMihyBFcKcwU2K6tpJxmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apex_containers";
  version = "0.0.4-3";
  src = sources.apex_containers;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ foonathan_memory_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
