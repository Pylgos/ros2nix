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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [ pybind11_vendor ];
  propagatedBuildInputs = [ geometry_msgs moveit_core moveit_ros_planning moveit_ros_planning_interface octomap_msgs rclcpp rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}