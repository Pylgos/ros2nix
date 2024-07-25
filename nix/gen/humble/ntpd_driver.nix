{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  poco,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntpd_driver = substituteSource {
      src = fetchgit {
        name = "ntpd_driver-source";
        url = "https://github.com/ros2-gbp/ntpd_driver-release.git";
        rev = "3e0ce55274357cab0b1d80da16108f1838abfdd0";
        hash = "sha256-Y3hISLK0EHzcJD4MrfgxDdmYH+cpgQTjbH3DCmbd0VE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntpd_driver";
  version = "2.2.0-1";
  src = sources.ntpd_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ poco rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
