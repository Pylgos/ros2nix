{
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rclcpp,
  rcpputils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_components = substituteSource {
      src = fetchgit {
        name = "rclcpp_components-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "95fa5468cb25d009be6cd39256739204060635b1";
        hash = "sha256-ByLSsYRlVUv/l0R1jirS3BrYE+FppOgfD4OP0Q1XBeQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "21.0.6-1";
  src = sources.rclcpp_components;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader composition_interfaces rclcpp rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
