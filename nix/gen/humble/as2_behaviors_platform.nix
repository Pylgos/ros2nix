{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_behavior,
  as2_core,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  substituteSource,
}:
let
  sources = rec {
    as2_behaviors_platform = substituteSource {
      src = fetchgit {
        name = "as2_behaviors_platform-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "a380572985fc6653a2c4d611150a6240578d69a8";
        hash = "sha256-sqsZSoIYU/0ucl2yUt4haLmQZY+LFFBDXO5y70zVvoA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behaviors_platform";
  version = "1.0.9-1";
  src = sources.as2_behaviors_platform;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_behavior as2_core as2_msgs rclcpp rclcpp_action ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
