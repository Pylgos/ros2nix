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
    phidgets_digital_inputs = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_inputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "0f10a2560c8274a8f272bdfa8bd37e2edaabd470";
        hash = "sha256-taMmD3Mb/CxQDtrkT5cyYYpsjvqCfhPtQH88w96/tto=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_digital_inputs";
  version = "2.3.3-1";
  src = sources.phidgets_digital_inputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
