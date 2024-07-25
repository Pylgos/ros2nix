{
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  tf2_py,
}:
let
  sources = rec {
    tf2_ros_py = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "b94ca7767bace352eaf2590b76ee6720756e63f2";
        hash = "sha256-5lVtYUjWVWl7vikpFt0gqmi1G00SqeAqWeMQDT0mqeg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros_py";
  version = "0.38.0-1";
  src = sources.tf2_ros_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy sensor_msgs std_msgs tf2_msgs tf2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
