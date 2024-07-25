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
  libusb1,
  pkg-config,
  rclcpp,
  rclcpp_components,
  rtcm_msgs,
  std_msgs,
  substituteSource,
  ublox_ubx_interfaces,
  ublox_ubx_msgs,
}:
let
  sources = rec {
    ublox_dgnss_node = substituteSource {
      src = fetchgit {
        name = "ublox_dgnss_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "0b249580822d68ee6ab16629431247231a782bec";
        hash = "sha256-223duq5yBXv87wyKALQRS0jN1uvo22vWbdGaneKq9ac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_dgnss_node";
  version = "0.5.2-1";
  src = sources.ublox_dgnss_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libusb1 rclcpp rclcpp_components rtcm_msgs std_msgs ublox_ubx_interfaces ublox_ubx_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
