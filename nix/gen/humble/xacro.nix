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
        rev = "f8020d99fdcc9815acc2cd4d93886b4e0a44805d";
        hash = "sha256-eAuqlK08Wgyt7c0NWvvi60x2oEt++k2Ppnn8YOQoufc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "xacro";
  version = "2.0.8-1";
  src = sources.xacro;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
