{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  autoware_lanelet2_extension,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lanelet2_core,
  lanelet2_io,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  python3Packages,
  python_cmake_module,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    autoware_lanelet2_extension_python = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension_python-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "a86c41cc2d55cd2ff47be9bca1f8c9824fc1482b";
        hash = "sha256-h9Pp8P4xjV1D41CEYNolr3IQCdeT4U2cB1wvH5TGbiA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_lanelet2_extension_python";
  version = "0.4.0-1";
  src = sources.autoware_lanelet2_extension_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto autoware_cmake python_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ autoware_lanelet2_extension geometry_msgs lanelet2_core lanelet2_io lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
