{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  camera_info_manager,
  depth_image_proc,
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
        rev = "6666deff20156f0330cb511e3f348d9d66c6e812";
        hash = "sha256-d5AMUxLjzzeQo2bIW0srlsIPpCsd+kQ7/CUlXwoP4bE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "openni2_camera";
  version = "2.2.0-2";
  src = sources.openni2_camera;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces camera_info_manager depth_image_proc image_transport rclcpp rclcpp_components rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
