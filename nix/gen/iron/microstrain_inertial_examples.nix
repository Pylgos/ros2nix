{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  microstrain_inertial_driver,
  rviz2,
  rviz_imu_plugin,
  sensor_msgs,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    microstrain_inertial_examples = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_examples-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "6d1fd47ce9017c2fd17c07974e3f69323ad1b35d";
        hash = "sha256-6qnRt0tiuZyHBlqC5NktccOcL7n5foFcwVNFivIhINg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_examples";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_examples;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ microstrain_inertial_driver rviz2 rviz_imu_plugin sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
