{
  ament_cmake,
  buildRosPackage,
  dataspeed_dbw_common,
  dbw_ford_can,
  dbw_ford_msgs,
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
    dbw_ford_joystick_demo = substituteSource {
      src = fetchgit {
        name = "dbw_ford_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "cef8ede82afeb2525ff1b0f79673c258d4bd25b5";
        hash = "sha256-ODY/NhEZYQZxQMl5aUr76mkwa1xOyKcvDd523SFSSOk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_ford_joystick_demo";
  version = "2.1.16-1";
  src = sources.dbw_ford_joystick_demo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_dbw_common dbw_ford_can dbw_ford_msgs joy rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
