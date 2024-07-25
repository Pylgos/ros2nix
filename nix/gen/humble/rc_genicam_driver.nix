{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rc_common_msgs,
  rc_genicam_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  stereo_msgs,
  substituteSource,
}:
let
  sources = rec {
    rc_genicam_driver = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "6d47251f3831c056bb7e1320153986632af45d92";
        hash = "sha256-DXGpRFliAauxi+eYKJddSkZfNo9jJ/5UsxBtJEkSdCs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_genicam_driver";
  version = "0.3.1-1";
  src = sources.rc_genicam_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater image_transport rc_common_msgs rc_genicam_api rclcpp rclcpp_components sensor_msgs stereo_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
