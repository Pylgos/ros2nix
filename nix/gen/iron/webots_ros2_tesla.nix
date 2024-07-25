{
  ackermann_msgs,
  ament_copyright,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_tesla = substituteSource {
      src = fetchgit {
        name = "webots_ros2_tesla-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "8422ea1f107d1f6cba5ef9ab706377b930ebe9c4";
        hash = "sha256-9L+L6YPQY0KkUGa3kLYss/0WZP/aQIM2TqA4GyLOTJA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_tesla";
  version = "2023.1.2-1";
  src = sources.webots_ros2_tesla;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_msgs builtin_interfaces python3Packages.opencv4 rclpy webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
