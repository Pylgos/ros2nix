{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  ros2launch,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    multidim_rrt_planner = substituteSource {
      src = fetchgit {
        name = "multidim_rrt_planner-source";
        url = "https://github.com/ros2-gbp/multidim_rrt_planner-release.git";
        rev = "42568252a48ae994a9b88c180e9f6c7895c97811";
        hash = "sha256-djrJ8kd3JGSYtBee3XdCR8371STpxVFjvf1sSMCpOeA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multidim_rrt_planner";
  version = "0.0.8-1";
  src = sources.multidim_rrt_planner;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2launch std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
