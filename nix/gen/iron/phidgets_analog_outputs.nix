{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_analog_outputs = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "302a9ee4c79d6b22978dee33b8c9cb6788169035";
        hash = "sha256-xi78W37HY59f/oeBUwFQpdqmfHhjmVubarF16PXOWiM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_analog_outputs";
  version = "2.3.3-1";
  src = sources.phidgets_analog_outputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api phidgets_msgs rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
