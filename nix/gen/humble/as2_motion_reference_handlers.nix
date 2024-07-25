{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_python,
  ament_lint_auto,
  as2_core,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_action,
  rclpy,
  std_msgs,
  std_srvs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    as2_motion_reference_handlers = substituteSource {
      src = fetchgit {
        name = "as2_motion_reference_handlers-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "68698697f6b25496a6dfe02db85014cb7a46d211";
        hash = "sha256-EJwOBsQK5u3f/NIq0Bx2dMCK8PphPS6ljhzfK1MJu4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_motion_reference_handlers";
  version = "1.0.9-1";
  src = sources.as2_motion_reference_handlers;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs eigen geometry_msgs rclcpp rclcpp_action rclpy std_msgs std_srvs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
