{
  ament_cmake,
  as2_alphanumeric_viewer,
  as2_behavior,
  as2_behavior_tree,
  as2_behaviors_motion,
  as2_behaviors_perception,
  as2_behaviors_platform,
  as2_behaviors_trajectory_generation,
  as2_cli,
  as2_core,
  as2_gazebo_assets,
  as2_gazebo_classic_assets,
  as2_keyboard_teleoperation,
  as2_motion_controller,
  as2_motion_reference_handlers,
  as2_msgs,
  as2_platform_crazyflie,
  as2_platform_gazebo,
  as2_platform_tello,
  as2_python_api,
  as2_realsense_interface,
  as2_state_estimator,
  as2_usb_camera_interface,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    aerostack2 = substituteSource {
      src = fetchgit {
        name = "aerostack2-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "5eb425a6429b064b363e05f7b1dec9e162b3b555";
        hash = "sha256-iJseHBcPlYfoNFH1C5AEd1DZqk9NVGpD2JQuFU6UsJs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aerostack2";
  version = "1.0.9-1";
  src = sources.aerostack2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_alphanumeric_viewer as2_behavior as2_behavior_tree as2_behaviors_motion as2_behaviors_perception as2_behaviors_platform as2_behaviors_trajectory_generation as2_cli as2_core as2_gazebo_assets as2_gazebo_classic_assets as2_keyboard_teleoperation as2_motion_controller as2_motion_reference_handlers as2_msgs as2_platform_crazyflie as2_platform_gazebo as2_platform_tello as2_python_api as2_realsense_interface as2_state_estimator as2_usb_camera_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
