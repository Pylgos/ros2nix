{
  ament_cmake,
  buildRosPackage,
  elfutils,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    backward_ros = substituteSource {
      src = fetchgit {
        name = "backward_ros-source";
        url = "https://github.com/ros2-gbp/backward_ros-release.git";
        rev = "b3ab49ff29a571c688da5b8e2085c46ae9123427";
        hash = "sha256-MH1nloz3Qfp5iNsqHTkmAkreWP6K+jyT3Zqn2SJySuU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "backward_ros";
  version = "1.0.2-5";
  src = sources.backward_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ elfutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
