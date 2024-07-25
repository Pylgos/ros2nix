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
        rev = "1747537dffb4889db1ce1b15ca39baddbf3f3f6a";
        hash = "sha256-3S24ljkfL+sFiIjvBV/NOFAUqBP3Eo5tdnFls6Ak19w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_cascade_lifecycle";
  version = "1.0.5-1";
  src = sources.rclcpp_cascade_lifecycle;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cascade_lifecycle_msgs lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
