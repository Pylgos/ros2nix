{
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_copyright = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "2d8e6b070f3c8d9ace01cfc7dba24398138d48fb";
        hash = "sha256-dFvZQqLBYlQqiLIwPHAtN1xiX5b1Z4JNp6rY8zrdF4Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.12.11-1";
  src = sources.ament_cmake_copyright;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_copyright ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
