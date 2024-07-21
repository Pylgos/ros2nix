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
        rev = "cf73bd6240c8b19a819681498f671f0c3ca80758";
        hash = "sha256-+93WLiVZewjzhzlEzSTG/zTjYx3+ri7uv+d7nO1xdX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "xacro";
  version = "2.0.11-2";
  src = sources.xacro;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
