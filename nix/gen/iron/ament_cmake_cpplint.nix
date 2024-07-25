{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_cpplint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_cpplint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "78868af55deedb2ef034407b19179a8d0fc258d5";
        hash = "sha256-66oithTIVCW7l/fXD3lVNmLCIyG6hyAzZiiC3aYZ8c8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_cpplint";
  version = "0.14.3-1";
  src = sources.ament_cmake_cpplint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_cpplint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
