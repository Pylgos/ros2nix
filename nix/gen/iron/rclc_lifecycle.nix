{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  osrf_testing_tools_cpp,
  rcl_lifecycle,
  rclc,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rclc_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "048104566ce29c37c3d5c3dd46664575f7cb0706";
        hash = "sha256-LNwc7q7wH3zq3p25t+NPmkXUWzekFwHznWWSJr/mKIQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "5.0.1-1";
  src = sources.rclc_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl_lifecycle rclc std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
