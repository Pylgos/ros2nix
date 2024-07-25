{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rt_usb_9axisimu_driver = substituteSource {
      src = fetchgit {
        name = "rt_usb_9axisimu_driver-source";
        url = "https://github.com/ros2-gbp/rt_usb_9axisimu_driver-release.git";
        rev = "8d27a959d633f972d116b6d7557ed9756ca8f686";
        hash = "sha256-MDRw+0TlCRvXa7mHA4a33Xv/lrMHiX2/k+BzVV9aXvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rt_usb_9axisimu_driver";
  version = "2.0.2-1";
  src = sources.rt_usb_9axisimu_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
