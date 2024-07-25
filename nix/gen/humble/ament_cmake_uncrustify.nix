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
        rev = "b055c8773a44386bb9f972ee4c7747bfb7a706ec";
        hash = "sha256-zt8BLQV/3+rgglKPPfwmM0d7ZkeedmMZyRMBtR8OX+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_uncrustify";
  version = "0.12.11-1";
  src = sources.ament_cmake_uncrustify;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_uncrustify ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
