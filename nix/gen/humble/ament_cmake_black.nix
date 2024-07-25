{
  ament_black,
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_black = substituteSource {
      src = fetchgit {
        name = "ament_cmake_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "27c1cb740080a55b5ffbe0508d78e455dd61bf0b";
        hash = "sha256-+J4lUnp6nAP4gCaqIpWUixT404dEjDK07Dw7xcjhjEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_black";
  version = "0.2.4-1";
  src = sources.ament_cmake_black;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_black ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
