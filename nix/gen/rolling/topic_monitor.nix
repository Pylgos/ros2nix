{
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_monitor = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "c3355cd98120d1b0e19af22c83cd8c0a277f4936";
        hash = "sha256-cXUY/0Ix0nndD8SV4qsrIWdL8diwQdAGAv09bmjOSyQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_monitor";
  version = "0.34.1-1";
  src = sources.topic_monitor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
