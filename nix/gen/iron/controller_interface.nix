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
        rev = "bdfa1f5b6a3680abbc1932b1b870684f2a216965";
        hash = "sha256-yhiBRqHD41GfHEHNoMA3M1PUOy3gRaa8VEprRYWWdbs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_interface";
  version = "3.25.0-1";
  src = sources.controller_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface rclcpp_lifecycle sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
