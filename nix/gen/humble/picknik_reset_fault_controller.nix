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
        rev = "50e8d59d0e9e6c44c8c4ed10a1e8d01340ce55c0";
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
