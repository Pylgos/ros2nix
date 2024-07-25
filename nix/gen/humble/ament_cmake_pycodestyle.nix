{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pycodestyle = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "3be01812ffb4495c6c932cdbd2505880299202ae";
        hash = "sha256-CLF3Y4ZXrhUQE3dzj9Xqh+TrNnuqvjhX+3o4J0xuIJw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pycodestyle";
  version = "0.12.11-1";
  src = sources.ament_cmake_pycodestyle;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pycodestyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
