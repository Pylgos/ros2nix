{
  ament_cmake,
  buildRosPackage,
  dynamixel_sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    turtlebot3_manipulation_hardware = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_hardware-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "2e22c8c7ac71011b1ee46833b0853dfc9b24d094";
        hash = "sha256-ZRbnMZylTUQ3uT5cOAYR1j4714J5p30gJqM6nrMxwQk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_hardware";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_hardware;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk hardware_interface pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
