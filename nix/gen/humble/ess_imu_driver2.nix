{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ess_imu_driver2 = substituteSource {
      src = fetchgit {
        name = "ess_imu_driver2-source";
        url = "https://github.com/ros2-gbp/ess_imu_driver2-release.git";
        rev = "ecd3636ff708e528d76a2b16f1448570af64e668";
        hash = "sha256-DKdGfokeWA8iz1G0MNUoqZYXJzhX4RSiQ3pV7wFtLp0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ess_imu_driver2";
  version = "1.0.1-1";
  src = sources.ess_imu_driver2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
