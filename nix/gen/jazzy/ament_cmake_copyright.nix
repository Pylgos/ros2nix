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
        rev = "1b5882814156bc618855e3ea600b8956676362c9";
        hash = "sha256-t0vY5c9Qog/0tjpoeXMzi90mG3EGT93frRtS4CWiCok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.17.1-1";
  src = sources.ament_cmake_copyright;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_copyright ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
