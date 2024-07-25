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
        rev = "0fcaee87bb3cde7af987081168dd0a9a972a36de";
        hash = "sha256-ae1L5kVMRpvH7iBOalN1FxQnzSFy56wB6hQ19ui/v74=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_components";
  version = "16.0.9-1";
  src = sources.rclcpp_components;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader composition_interfaces rclcpp rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
