{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    sick_scan_xd = substituteSource {
      src = fetchgit {
        name = "sick_scan_xd-source";
        url = "https://github.com/ros2-gbp/sick_scan_xd-release.git";
        rev = "7086e3a6d84b0917bc845085860a99f598576e22";
        hash = "sha256-BsB3KIayNL+JY+49OzB9j4yJ7VZdJiosk2Oqbu3V6OI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_scan_xd";
  version = "3.4.0-1";
  src = sources.sick_scan_xd;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater geometry_msgs nav_msgs rcl_interfaces rosidl_default_runtime sensor_msgs std_msgs tf2 tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
