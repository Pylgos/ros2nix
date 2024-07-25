{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  camera_info_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  pkg-config,
  rclcpp,
  rclcpp_components,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    openni2_camera = substituteSource {
      src = fetchgit {
        name = "openni2_camera-source";
        url = "https://github.com/ros2-gbp/openni2_camera-release.git";
        rev = "127378c95f345c6f8a8f54bac4919db4c9ca6d31";
        hash = "sha256-zbJBelSwvfA6Q5iZN+Ab+bTBCsYUNi3sHR94M1oLg00=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openni2_camera";
  version = "2.0.1-3";
  src = sources.openni2_camera;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces camera_info_manager image_transport rclcpp rclcpp_components rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
