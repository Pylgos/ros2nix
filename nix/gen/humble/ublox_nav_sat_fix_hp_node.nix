{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  ublox_ubx_interfaces,
  ublox_ubx_msgs,
}:
let
  sources = rec {
    ublox_nav_sat_fix_hp_node = substituteSource {
      src = fetchgit {
        name = "ublox_nav_sat_fix_hp_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "f17effcf2361006ae88baec94304bcf013097c0a";
        hash = "sha256-e1VplIU6tWb6AUxTJ5T9Lg+aE+kzMztpnhQ2VxisbEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_nav_sat_fix_hp_node";
  version = "0.5.2-1";
  src = sources.ublox_nav_sat_fix_hp_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_msgs ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
