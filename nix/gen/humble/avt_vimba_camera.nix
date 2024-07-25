{
  ament_cmake_auto,
  buildRosPackage,
  camera_info_manager,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_proc,
  image_transport,
  message_filters,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  stereo_image_proc,
  substituteSource,
}:
let
  sources = rec {
    avt_vimba_camera = substituteSource {
      src = fetchgit {
        name = "avt_vimba_camera-source";
        url = "https://github.com/ros2-gbp/avt_vimba_camera-release.git";
        rev = "98269e9716399c2d996f6dedfd1cd2d1dac97b03";
        hash = "sha256-b1YFGg6j0b9K0ewtxAKbcnT1um/8yTIj7XIIbEChDbY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "avt_vimba_camera";
  version = "2001.1.0-3";
  src = sources.avt_vimba_camera;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager diagnostic_msgs diagnostic_updater image_proc image_transport message_filters rclcpp rclcpp_components sensor_msgs std_msgs stereo_image_proc ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}