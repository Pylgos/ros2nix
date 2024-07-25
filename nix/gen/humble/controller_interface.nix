{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  rclcpp_lifecycle,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    controller_interface = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "1bba5e6f91b9bedf2c5905d3ef4b223a9a05ed5b";
        hash = "sha256-wwtInPWC0p9S8a+bewflGobYGF6cLg9NVIId5oMPSLI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_interface";
  version = "2.41.0-1";
  src = sources.controller_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface rclcpp_lifecycle sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
