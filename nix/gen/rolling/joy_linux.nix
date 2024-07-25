{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    joy_linux = substituteSource {
      src = fetchgit {
        name = "joy_linux-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "3ba3794b6061c3c7a1ed7904cbc5d337a57c6fec";
        hash = "sha256-MCxXwhqUhQHqDvJeyzEVpjLjHtbbIKly+aduefEBefM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joy_linux";
  version = "3.3.0-2";
  src = sources.joy_linux;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
