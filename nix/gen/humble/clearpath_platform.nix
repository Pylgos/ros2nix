{
  ament_cmake,
  buildRosPackage,
  clearpath_control,
  clearpath_platform_description,
  clearpath_platform_msgs,
  controller_interface,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  hardware_interface,
  nav_msgs,
  pluginlib,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
  xacro,
}:
let
  sources = rec {
    clearpath_platform = substituteSource {
      src = fetchgit {
        name = "clearpath_platform-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "4eb170368b0601d47ffc2708626412b397e3417e";
        hash = "sha256-r7ir2w9zDgdvG0tMyWJ3ZVV8bBW78q8B4ol5XnBFryI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_platform";
  version = "0.2.9-1";
  src = sources.clearpath_platform;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_control clearpath_platform_description clearpath_platform_msgs controller_interface controller_manager controller_manager_msgs geometry_msgs hardware_interface nav_msgs pluginlib rclcpp sensor_msgs std_msgs std_srvs tf2 tf2_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
