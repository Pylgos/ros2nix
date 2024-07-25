{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "94cddc0704b17bd6cf130771fcf3e6a50e8d00df";
        hash = "sha256-/23hP0CwYVXFYcO8e3p17B3YNIGQZnNWqXNjv6DZa7c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pep257";
  version = "0.14.3-1";
  src = sources.ament_cmake_pep257;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pep257 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_pep257 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
