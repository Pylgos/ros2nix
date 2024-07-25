{
  ament_cmake,
  ament_cmake_gen_version_h,
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
        rev = "9894129ae243a94ada95646a57801d3248ea2d74";
        hash = "sha256-u5JVBXxY6899Vl9Gm/7xnM+Xc7+E21D8G+wBEqY6jlE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_interface";
  version = "4.12.0-1";
  src = sources.controller_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface rclcpp_lifecycle sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
