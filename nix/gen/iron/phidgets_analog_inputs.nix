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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_analog_inputs = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "91fe3c09b60395465e2b5f6b6573bab4a8c94aa3";
        hash = "sha256-cMwYeNmiFnip2gj4Ih+D+arDK2cxYuKHts79lM/mIVg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_analog_inputs";
  version = "2.3.3-1";
  src = sources.phidgets_analog_inputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
