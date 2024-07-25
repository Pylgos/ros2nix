{
  ament_cmake,
  buildRosPackage,
  dataspeed_dbw_common,
  dbw_polaris_can,
  dbw_polaris_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dbw_polaris_joystick_demo = substituteSource {
      src = fetchgit {
        name = "dbw_polaris_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "9716df50b9edcf908d56f3ca10ff561ec540abd4";
        hash = "sha256-nypSpr0DVaSJfwgj9CAYZp642A8x1yr7DC/7PqlbNGo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_polaris_joystick_demo";
  version = "2.1.16-1";
  src = sources.dbw_polaris_joystick_demo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_dbw_common dbw_polaris_can dbw_polaris_msgs joy rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
