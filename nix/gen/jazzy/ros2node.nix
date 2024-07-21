{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2node = substituteSource {
      src = fetchgit {
        name = "ros2node-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "a3f805865fbc26c9231798f40fedbdb052c1159d";
        hash = "sha256-ldTUVQjlf++mL5uLb/d4St3RX/MYVIKuO1AhFn9GnkQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2node";
  version = "0.32.1-1";
  src = sources.ros2node;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
