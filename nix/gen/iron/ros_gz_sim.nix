{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  pkg-config,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros_gz_sim = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "4322055c0a910ec53d3e49eefe0acacffc0a2b6f";
        hash = "sha256-pCPC6LyI7UHx42j1qfB/NpbA4x2BxNxq/Y0qj9+ZI5g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "0.254.1-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gflags rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
