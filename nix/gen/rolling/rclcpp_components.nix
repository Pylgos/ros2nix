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
        rev = "5824ecd578733cdbb80fb744b6845ef44391c395";
        hash = "sha256-76/sS68WDmV2KlSWoyiJjvEPCL/U8umT+HmUTaFvfeg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "28.3.1-1";
  src = sources.rclcpp_components;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp class_loader composition_interfaces rclcpp rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}