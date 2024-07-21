{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  bluez,
  buildRosPackage,
  cwiid,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  wiimote_msgs,
}:
let
  sources = rec {
    wiimote = substituteSource {
      src = fetchgit {
        name = "wiimote-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "511ae4275bf3980a65c8af0f85f1e07748487b7e";
        hash = "sha256-WghWanmw0GXmNOdR/EHg1/ytIXNtIKstCe5hSIgpQ/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wiimote";
  version = "3.3.0-3";
  src = sources.wiimote;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ bluez cwiid ];
  propagatedBuildInputs = [ bluez cwiid geometry_msgs rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_msgs std_srvs wiimote_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
