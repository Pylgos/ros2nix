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
    picknik_reset_fault_controller = substituteSource {
      src = fetchgit {
        name = "picknik_reset_fault_controller-source";
        url = "https://github.com/ros2-gbp/picknik_controllers-release.git";
        rev = "e5db281063a81755a6872a8ad4bc2e8acdb6afcb";
        hash = "sha256-1YeT/ItbimfyeiruRaU6K0IcXsIuJworLhzpN4VczDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "picknik_reset_fault_controller";
  version = "0.0.3-1";
  src = sources.picknik_reset_fault_controller;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface example_interfaces geometry_msgs rclcpp realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
