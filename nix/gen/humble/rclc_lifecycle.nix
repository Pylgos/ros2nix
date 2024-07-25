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
        rev = "ceaa532f70039c4db8886f4a40300bab466f7938";
        hash = "sha256-FhlL210r7p//YsaTVrhSC1apBMGYtGF04fe2Uv46030=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclc_lifecycle";
  version = "4.0.2-3";
  src = sources.rclc_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl_lifecycle rclc std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
