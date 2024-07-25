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
        rev = "7ea2cf806cefce324b226cb2d23e85b8b5145544";
        hash = "sha256-jFt2htN0W6WrH5+HvPcB8a8LiZVGImOlJPKJXZevfY4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim";
  version = "0.244.15-1";
  src = sources.ros_gz_sim;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gflags rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
