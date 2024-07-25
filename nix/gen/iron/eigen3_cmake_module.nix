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
        rev = "4284f039b515f438e579653af42693e2ef7ba2f2";
        hash = "sha256-ZNeTPK1scwhT7qwHa6gMmf2DSC8J8uZ3+zwU7ekvgIk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigen3_cmake_module";
  version = "0.2.2-4";
  src = sources.eigen3_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
