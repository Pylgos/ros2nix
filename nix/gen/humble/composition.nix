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
        rev = "150c209bc5439b8bd45480d876d8967fd7557fc2";
        hash = "sha256-NzR1iOMoAkWc++hoinPJvqYVlgJKdYhoiI20qO3F1Bc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition";
  version = "0.20.4-1";
  src = sources.composition;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces launch_ros rclcpp rclcpp_components rcutils std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
