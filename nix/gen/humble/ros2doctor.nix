{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildPackages,
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
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros2doctor = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "548d1d77096217d8ab09da4a048ad2a653cb9cbe";
        hash = "sha256-NNTHMzcabXJPMCKzB58eaDQRVfCjGFwyF/XRyvByxxM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2doctor";
  version = "0.18.10-1";
  src = sources.ros2doctor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.importlib-metadata ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.psutil python3Packages.rosdistro rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
