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
        rev = "8076077b2f2a2494abee6fc723d165f3ace7db01";
        hash = "sha256-QzCLyUeMx9nxzjb89HQJ9Hc/HkQsAIGIdMxMiy/dTgQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ros";
  version = "0.27.1-1";
  src = sources.launch_testing_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
