{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  rclcpp,
  rclcpp_components,
  rcutils,
  rmw_implementation_cmake,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    composition = substituteSource {
      src = fetchgit {
        name = "composition-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "d8425fb59028381823430e1810bda9e1098ce11b";
        hash = "sha256-Ss8Ila3kk8KZ1W7yyvYPySrk41qH7AL3NOSxiyavx0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition";
  version = "0.27.1-1";
  src = sources.composition;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
