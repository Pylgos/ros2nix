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
        rev = "26b6aa595d2c33bdde96fd71ebe20ae29e941509";
        hash = "sha256-p/pvHIOdYmdayP0w9SSnmOLGpfqmK7JoBhT/cvL9Gbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_tf2_py";
  version = "0.38.0-1";
  src = sources.examples_tf2_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros rclpy sensor_msgs tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
