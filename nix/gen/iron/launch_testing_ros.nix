{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ros = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "b678d5a18ae3d8024dd0a945c0f49611e89e9836";
        hash = "sha256-CXJyN0Erb8vc33MUV5b5ki9PeSYzg7UrZC8St+XlGSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ros";
  version = "0.24.1-1";
  src = sources.launch_testing_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
