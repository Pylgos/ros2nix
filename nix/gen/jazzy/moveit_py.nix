{
  ament_cmake,
  ament_cmake_pytest,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  moveit_core,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  octomap_msgs,
  pybind11_vendor,
  python3Packages,
  rclcpp,
  rclpy,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_py = substituteSource {
      src = fetchgit {
        name = "moveit_py-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1a2ca49341be3d3cfdda1883cf49118ccdf47c62";
        hash = "sha256-g7saOz9IdlSXYFhRUfWk6SF4+/6zNq8nFfHzfeWf2bo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_py";
  version = "2.10.0-1";
  src = sources.moveit_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs moveit_core moveit_ros_planning moveit_ros_planning_interface octomap_msgs pybind11_vendor rclcpp rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
