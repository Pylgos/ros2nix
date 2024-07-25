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
        rev = "cdd74ec3fbb8505c14bfa376d35f7a08b65b8eb7";
        hash = "sha256-MH1nloz3Qfp5iNsqHTkmAkreWP6K+jyT3Zqn2SJySuU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "backward_ros";
  version = "1.0.2-3";
  src = sources.backward_ros;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ elfutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
