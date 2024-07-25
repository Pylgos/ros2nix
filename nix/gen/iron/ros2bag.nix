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
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  substituteSource,
}:
let
  sources = rec {
    ros2bag = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "24e93764d299765d7aeadd10a70b348058ca57fc";
        hash = "sha256-dH+T7WDU1u94iqtEp8qq8By3po7bQ6Phct9hejHI4bQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2bag";
  version = "0.22.6-1";
  src = sources.ros2bag;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosbag2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
