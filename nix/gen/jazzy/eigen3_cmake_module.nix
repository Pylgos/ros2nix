{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    eigen3_cmake_module = substituteSource {
      src = fetchgit {
        name = "eigen3_cmake_module-source";
        url = "https://github.com/ros2-gbp/eigen3_cmake_module-release.git";
        rev = "558850a9bed7e064e1dd11c03f5c43eaeaa8f656";
        hash = "sha256-k2+KI5dgNItTq+Q9z/ORtjXBmyG29cWrs8Hwqk6lw5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen3_cmake_module";
  version = "0.3.0-3";
  src = sources.eigen3_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}