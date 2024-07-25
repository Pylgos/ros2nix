{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_accelerometer = substituteSource {
      src = fetchgit {
        name = "phidgets_accelerometer-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "e621803b98eb014f402814b9a763e977a6097ab6";
        hash = "sha256-n67meToobs7UjIZD2wOckhr3agFm7lVHWykPlZdb3zA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_accelerometer";
  version = "2.3.3-1";
  src = sources.phidgets_accelerometer;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
