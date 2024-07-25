{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_flake8,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_flake8 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a52fc877ca42d0fb639402bcc659a9cc70fd4283";
        hash = "sha256-laz7ulPScCD4r98G7NR9jKggS8699qLnMUdCi6rVF5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_flake8";
  version = "0.14.3-1";
  src = sources.ament_cmake_flake8;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_flake8 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_flake8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
