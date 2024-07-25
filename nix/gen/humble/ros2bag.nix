{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosbag2_py,
  substituteSource,
}:
let
  sources = rec {
    ros2bag = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c926f797360bf3ba13f6ba607ab7d598e68da01a";
        hash = "sha256-nlGCwsDE3ynynUpOm0lAxoonHqVhXC4yw+zjEgIAJaw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2bag";
  version = "0.15.11-1";
  src = sources.ros2bag;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosbag2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
