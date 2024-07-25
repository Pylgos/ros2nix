{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  camera_info_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  launch_pytest,
  rclcpp,
  rclcpp_components,
  substituteSource,
  vimbax_camera_events,
  vimbax_camera_msgs,
  vmbc_interface,
}:
let
  sources = rec {
    vimbax_camera = substituteSource {
      src = fetchgit {
        name = "vimbax_camera-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "5ce74b5ef803cb7b5177f4ef3d0897b7c8615335";
        hash = "sha256-/RxOmnarS/N/KJnsiiDP7aFUPvTqgGpZNa8J8HO6EWY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vimbax_camera";
  version = "1.0.2-1";
  src = sources.vimbax_camera;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager image_transport rclcpp rclcpp_components vimbax_camera_events vimbax_camera_msgs vmbc_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
