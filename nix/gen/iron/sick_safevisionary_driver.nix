{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  python3Packages,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  sick_safevisionary_base,
  sick_safevisionary_interfaces,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_driver = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_driver-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "5034a3f06543af08551ac69581e90c2c94cc3f62";
        hash = "sha256-+JkVULStq1kUDR609jEbn44uWsjZ4O5x1ogtxSHoM8Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_driver";
  version = "1.0.3-1";
  src = sources.sick_safevisionary_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge lifecycle_msgs python3Packages.boost rclcpp rclcpp_lifecycle sensor_msgs sick_safevisionary_base sick_safevisionary_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
