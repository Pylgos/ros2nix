{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_core,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_behavior = substituteSource {
      src = fetchgit {
        name = "as2_behavior-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "d67929b36df0b7d1524c45c657043ff23a0e7193";
        hash = "sha256-a0l0Vk6vWA3IU+pFgp8DO2TV0wEKXMA9v4s9Ki93oMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_behavior";
  version = "1.0.9-1";
  src = sources.as2_behavior;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs rclcpp std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
