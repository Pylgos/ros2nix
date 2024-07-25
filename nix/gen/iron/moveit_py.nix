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
        rev = "21103a52f292416b6324b25bf9557a920ae3c7fe";
        hash = "sha256-pqC6AiR6v8mATT/3YHlZ3oxQaeXFtiSfiz/k3WPDvgs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_py";
  version = "2.8.0-1";
  src = sources.moveit_py;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs moveit_core moveit_ros_planning moveit_ros_planning_interface octomap_msgs pybind11_vendor rclcpp rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
