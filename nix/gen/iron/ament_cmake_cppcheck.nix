{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cppcheck,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cppcheck = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9ce1fbbd95f0a86244e6a3fbf266765bc5d090fd";
        hash = "sha256-LbI8QdCj8KKt571HUbSxA+mQctTURCBta2d4svbuv8M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cppcheck";
  version = "0.14.3-1";
  src = sources.ament_cmake_cppcheck;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ament_cppcheck ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
