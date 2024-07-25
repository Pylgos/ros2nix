{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  diagnostic_aggregator,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    turtlebot4_diagnostics = substituteSource {
      src = fetchgit {
        name = "turtlebot4_diagnostics-source";
        url = "https://github.com/ros2-gbp/turtlebot4_robot-release.git";
        rev = "108c8ccd1e5f9c779b0d039cc47f1ebb16c54810";
        hash = "sha256-DitXMf+cJDEdUJ0LxngR3TM7j69oomjSW7UYvlvcGD0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_diagnostics";
  version = "1.0.3-1";
  src = sources.turtlebot4_diagnostics;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_msgs diagnostic_updater irobot_create_msgs rclpy sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
