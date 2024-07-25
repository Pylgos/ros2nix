{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_ros,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    examples_tf2_py = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "719de60b780910dd12c161d6a775277e17a494be";
        hash = "sha256-n0d41tIotE0l3VGQJaPnIjxvxDouWUefM1/cfHwjXfc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_tf2_py";
  version = "0.31.7-1";
  src = sources.examples_tf2_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros rclpy sensor_msgs tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
