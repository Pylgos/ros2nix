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
        rev = "a1accb8cfe99aef200cd3993dd85b5838fbf3e72";
        hash = "sha256-m1lf8g2hH9cB6Iqan/wonioCROok1kEkFM3681fSQyI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pclint";
  version = "0.14.3-1";
  src = sources.ament_cmake_pclint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pclint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
