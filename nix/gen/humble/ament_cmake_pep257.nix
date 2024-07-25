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
        rev = "6da59c9ba176e7c8db04c46247887ccc7880e41e";
        hash = "sha256-WEy+ccLwrWhcRVaXLhDJwkjp3To9iNoZf4zK7K96hd4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pep257";
  version = "0.12.11-1";
  src = sources.ament_cmake_pep257;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pep257 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_pep257 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
