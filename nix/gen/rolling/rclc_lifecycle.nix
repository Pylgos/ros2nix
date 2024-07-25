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
        rev = "20317ad1b89212bf608c06c988dbd1ee3039fc55";
        hash = "sha256-S6rPft/BC8XXLe0C9UCT8oPlYVqM0Vvvoj1MqVoApNQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "6.1.0-2";
  src = sources.rclc_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl_lifecycle rclc std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}