{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_processors,
  imu_transformer,
  substituteSource,
}:
let
  sources = rec {
    imu_pipeline = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "f4f45b6e65736bb43363ee7c1dd9d0663ec936d5";
        hash = "sha256-dJGjG62iCrupov3xWznx6yfooP5Q5w6rg7pfsX1P9x0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_pipeline";
  version = "0.5.0-2";
  src = sources.imu_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_processors imu_transformer ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}