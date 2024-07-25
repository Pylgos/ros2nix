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
        rev = "39a50da38f1ad0ea8e54854cee26156e81c754fa";
        hash = "sha256-WghWanmw0GXmNOdR/EHg1/ytIXNtIKstCe5hSIgpQ/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wiimote";
  version = "3.3.0-1";
  src = sources.wiimote;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bluez cwiid geometry_msgs rclcpp rclcpp_components rclcpp_lifecycle sensor_msgs std_msgs std_srvs wiimote_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
