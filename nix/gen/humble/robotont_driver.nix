{
  ament_cmake,
  ament_cmake_auto,
  asio,
  asio_cmake_module,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  io_context,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  serial_driver,
  std_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    robotont_driver = substituteSource {
      src = fetchgit {
        name = "robotont_driver-source";
        url = "https://github.com/ros2-gbp/robotont_driver-release.git";
        rev = "54ea48dbc7551170e79e515e2b7a98066a013cbd";
        hash = "sha256-NRqqIL+cQql2vfYFYRca9U06zHQBczT7oY8O1lq2ZSs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotont_driver";
  version = "0.1.4-1";
  src = sources.robotont_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto asio_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio geometry_msgs io_context nav_msgs pluginlib rclcpp rclcpp_components rclcpp_lifecycle serial_driver std_msgs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
