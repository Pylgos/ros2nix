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
        rev = "fde6ea177891568db5b8a44275cf91d4eb5a803c";
        hash = "sha256-KgZNW5AXJW0KLo3rLcVp40gmGs4v0CWYoIH48DRsHFQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros_py";
  version = "0.31.7-1";
  src = sources.tf2_ros_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy sensor_msgs std_msgs tf2_msgs tf2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
