{
  ament_cmake_ros,
  buildRosPackage,
  controller_interface,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  realtime_tools,
  substituteSource,
}:
let
  sources = rec {
    picknik_twist_controller = substituteSource {
      src = fetchgit {
        name = "picknik_twist_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "bea086060bcaeccc43e2e8d0a099ffd690da73c0";
        hash = "sha256-y6aZb1J/2JpuY/SFhUMgaDqYvXU7KiQYiETGOGIYF3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_twist_controller";
  version = "0.0.3-1";
  src = sources.picknik_twist_controller;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface example_interfaces geometry_msgs rclcpp realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}