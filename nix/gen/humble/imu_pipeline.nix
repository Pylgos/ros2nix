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
        rev = "e5450795df72c599f4b351edc13b128df5f4af5f";
        hash = "sha256-Stfof1r7uZTNTGVW0TV5Ck2J/V2ucskd+80gR7TSyDo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_pipeline";
  version = "0.4.1-1";
  src = sources.imu_pipeline;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_processors imu_transformer ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
