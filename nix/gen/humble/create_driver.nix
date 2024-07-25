{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  create_msgs,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libcreate,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    create_driver = substituteSource {
      src = fetchgit {
        name = "create_driver-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "a81cd010f673172c88e7cc76d5d4643d9e9919e9";
        hash = "sha256-MtmP441wu0T5gtTDWlUotICJL0MbA0MvOMuBMViUxdQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create_driver";
  version = "3.1.0-1";
  src = sources.create_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ create_msgs diagnostic_msgs diagnostic_updater geometry_msgs libcreate nav_msgs rclcpp sensor_msgs std_msgs tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
