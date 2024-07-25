{
  ament_copyright,
  ament_flake8,
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
        rev = "cdcde347af85c916d28faab85f5bc24e2a17ef8f";
        hash = "sha256-J93ufIVfm1rz9umJWhgzDpq2x3OYCNsAlLRbvT5uwBs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ros";
  version = "0.19.7-2";
  src = sources.launch_testing_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch_testing ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
