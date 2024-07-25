{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  gpsd,
  pkg-config,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    gpsd_client = substituteSource {
      src = fetchgit {
        name = "gpsd_client-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "df12ba4f25487ea034154876cdae789f0518bc13";
        hash = "sha256-Ssq5pihtdqJuy//6IfxXwaJCV1EC4X7urzYBOcONtjQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gpsd_client";
  version = "2.0.4-1";
  src = sources.gpsd_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gps_msgs gpsd rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
