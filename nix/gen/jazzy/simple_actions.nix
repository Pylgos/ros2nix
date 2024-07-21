{
  action_msgs,
  action_tutorials_interfaces,
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    simple_actions = substituteSource {
      src = fetchgit {
        name = "simple_actions-source";
        url = "https://github.com/ros2-gbp/simple_actions-release.git";
        rev = "c7252cf610f126324e386373d40978d43cd29abe";
        hash = "sha256-g9TlS44Lr3KdSWRB3wnibXGgKPYkTq996gaI+anSw7g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_actions";
  version = "0.3.0-3";
  src = sources.simple_actions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rclcpp rclcpp_action rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
