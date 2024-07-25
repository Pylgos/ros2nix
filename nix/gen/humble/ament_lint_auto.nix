{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_lint_auto = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "575cde1887ced53cbf7f08ccb993d5458f45112e";
        hash = "sha256-a1AC1FeEj+kAuPxY2lAUxMqy+GwFgXUYyqn2whoN+CA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_auto";
  version = "0.12.11-1";
  src = sources.ament_lint_auto;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
