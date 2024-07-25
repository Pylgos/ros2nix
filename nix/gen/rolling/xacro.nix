{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_index_python,
  ament_lint_auto,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    xacro = substituteSource {
      src = fetchgit {
        name = "xacro-source";
        url = "https://github.com/ros2-gbp/xacro-release.git";
        rev = "b40362a1d5d97599cac992900b0177b36308c257";
        hash = "sha256-+93WLiVZewjzhzlEzSTG/zTjYx3+ri7uv+d7nO1xdX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "xacro";
  version = "2.0.11-1";
  src = sources.xacro;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
