{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  opencv,
  rclcpp,
  rclcpp_components,
  rmw_implementation_cmake,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_tools = substituteSource {
      src = fetchgit {
        name = "image_tools-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "b680c3afbc34144ac62a4b09419655e1fab86b41";
        hash = "sha256-KrFnlSyVmrCE41oCqsXC5EfMr+X48HP+gsdyvko5k9M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_tools";
  version = "0.20.4-1";
  src = sources.image_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
