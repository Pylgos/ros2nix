{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8454e94295f692f1789e1a652421e863d15ab889";
        hash = "sha256-2jvAxkr71RKoFLIMX1yl9k+ZnSHu0pS1AjZDh85QZGo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_xmllint";
  version = "0.14.3-1";
  src = sources.ament_cmake_xmllint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_xmllint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
