{
  ament_cmake,
  buildRosPackage,
  dataspeed_dbw_common,
  dbw_fca_can,
  dbw_fca_msgs,
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
    dbw_fca_joystick_demo = substituteSource {
      src = fetchgit {
        name = "dbw_fca_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1df78c20ba71c5c6b3bac7e6407f646fd13854b9";
        hash = "sha256-WDZmtDf/suFuG1qUw5LwYAzM4KgxpWYRykOldY7MBWw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_fca_joystick_demo";
  version = "2.1.16-1";
  src = sources.dbw_fca_joystick_demo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dataspeed_dbw_common dbw_fca_can dbw_fca_msgs joy rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
