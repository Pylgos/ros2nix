{
  ament_cmake,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geographiclib,
  geometry_msgs,
  gps_msgs,
  libpcap,
  nav_msgs,
  nmea_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    septentrio_gnss_driver = substituteSource {
      src = fetchgit {
        name = "septentrio_gnss_driver-source";
        url = "https://github.com/ros2-gbp/septentrio_gnss_driver_ros2-release.git";
        rev = "cafe531cf88f44cd615c78b2951163c8d57f31ff";
        hash = "sha256-Niu7hKw+RoX5arAfszLzwSA7s386DFt5rV01ULTfYrs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "septentrio_gnss_driver";
  version = "1.4.0-3";
  src = sources.septentrio_gnss_driver;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs geographiclib geometry_msgs gps_msgs libpcap nav_msgs nmea_msgs python3Packages.boost rclcpp rclcpp_components rosidl_default_runtime sensor_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
