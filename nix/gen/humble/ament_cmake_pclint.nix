{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pclint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pclint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "00a2b02cb3e3d992fdb4e843477270904a215e3c";
        hash = "sha256-Xmn1I8dGy278vFNpW8jghyBUkMlMypzltZs3JtMB278=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pclint";
  version = "0.12.11-1";
  src = sources.ament_cmake_pclint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pclint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
