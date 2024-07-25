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
        rev = "ed834048431e5643287d3a48ab03b3de694e242f";
        hash = "sha256-Y3hISLK0EHzcJD4MrfgxDdmYH+cpgQTjbH3DCmbd0VE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntpd_driver";
  version = "2.2.0-3";
  src = sources.ntpd_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ poco rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
