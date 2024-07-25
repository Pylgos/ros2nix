{
  ament_cmake,
  buildRosPackage,
  ds_dbw_can,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw_joystick_demo = substituteSource {
      src = fetchgit {
        name = "ds_dbw_joystick_demo-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "a33e59a9d856e266b181df5441ef656404d6772d";
        hash = "sha256-0a0K9avvM4RpKWvYtB9Kz+87fO5VzHm1vIr6Z/9vEm4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_joystick_demo";
  version = "2.1.16-1";
  src = sources.ds_dbw_joystick_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ds_dbw_can ds_dbw_msgs joy rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
