{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cascade_lifecycle_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_cascade_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "e72ca05c0e8c334d973d2cb1cde2e2dd9291f406";
        hash = "sha256-jnLMV11NT92uzCMWAEcBgLUG4kfv4dpyViPfqZU0NWI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_cascade_lifecycle";
  version = "1.1.0-1";
  src = sources.rclcpp_cascade_lifecycle;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cascade_lifecycle_msgs lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
