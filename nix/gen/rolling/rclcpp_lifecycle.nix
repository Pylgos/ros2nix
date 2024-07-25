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
  mimick_vendor,
  performance_test_fixture,
  rcl,
  rcl_interfaces,
  rcl_lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosidl_typesupport_cpp,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rclcpp_lifecycle = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "8df5161dbe74e9720e0de30d01397ae93b650331";
        hash = "sha256-owJeDMWZspenB31Po8QwcvtBqLCkj4e5PxrBgFykOck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_lifecycle";
  version = "28.3.1-1";
  src = sources.rclcpp_lifecycle;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rcl rcl_interfaces rcl_lifecycle rclcpp rcutils rmw rosidl_typesupport_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
