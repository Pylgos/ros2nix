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
        rev = "fb6325b445a199f927e85fa6eb1e2136f1b938b9";
        hash = "sha256-JYv6XaPTqspaLTKHbLNoNYx3ivXCTVAvRO3oNEhhxQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen3_cmake_module";
  version = "0.1.1-4";
  src = sources.eigen3_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
