{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  mrpt_sensorlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_sensor_bumblebee_stereo = substituteSource {
      src = fetchgit {
        name = "mrpt_sensor_bumblebee_stereo-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "b8849323e357a3c9c2b1371a219fc918f563dc36";
        hash = "sha256-JX7fUDoLcojqs1Xe67ADAjTqwlo/Y0hRI5Qer+kC37A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensor_bumblebee_stereo";
  version = "0.2.1-1";
  src = sources.mrpt_sensor_bumblebee_stereo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common mrpt2 mrpt_msgs mrpt_sensorlib rclcpp rclcpp_components tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
