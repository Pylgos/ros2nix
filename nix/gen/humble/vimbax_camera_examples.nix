{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  launch_pytest,
  rclcpp,
  rclcpp_components,
  rclpy,
  substituteSource,
  vimbax_camera_events,
  vimbax_camera_msgs,
}:
let
  sources = rec {
    vimbax_camera_examples = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_examples-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "df322254a7170e4456516f27f9e71139a1176a4e";
        hash = "sha256-LeVUkKuZvysWJ0XC+0zu5Dw+2+d9kVOelsVZkp6BsxU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vimbax_camera_examples";
  version = "1.0.2-1";
  src = sources.vimbax_camera_examples;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport rclcpp rclcpp_components rclpy vimbax_camera_events vimbax_camera_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
