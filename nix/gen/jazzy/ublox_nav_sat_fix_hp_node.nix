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
        rev = "742d0d6b4ce9ad0d27ef86a0a88e48b9875d9430";
        hash = "sha256-tSiEDFsNto+4KxHDINiu/T57IUkWnrtle7tkbT+B+c0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_nav_sat_fix_hp_node";
  version = "0.5.3-2";
  src = sources.ublox_nav_sat_fix_hp_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components sensor_msgs std_msgs ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}