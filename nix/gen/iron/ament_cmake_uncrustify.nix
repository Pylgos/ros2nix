{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "b3bdcc65dec4438baff2423db8c87dafa16a5ec7";
        hash = "sha256-0Uqp71xAP0tHudYdKEoXLnk0pgkHGSCKVyc7M7uCENA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_uncrustify";
  version = "0.14.3-1";
  src = sources.ament_cmake_uncrustify;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_uncrustify ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
