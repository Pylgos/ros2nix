{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_high_speed_encoder = substituteSource {
      src = fetchgit {
        name = "phidgets_high_speed_encoder-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "74d187772a5d5e93289a2a24863b376c0de257ed";
        hash = "sha256-+tQ+vw/pWTXBDexHIJi6YokVycAl8GdJSxKQ6Lxj39Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_high_speed_encoder";
  version = "2.3.3-1";
  src = sources.phidgets_high_speed_encoder;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api phidgets_msgs rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
