{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  py_trees,
  py_trees_ros_interfaces,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2topic,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_ros_py,
  unique_identifier_msgs,
}:
let
  sources = rec {
    py_trees_ros = substituteSource {
      src = fetchgit {
        name = "py_trees_ros-source";
        url = "https://github.com/ros2-gbp/py_trees_ros-release.git";
        rev = "014ca2c971d4fc59bec25a8758283b088b04e8f5";
        hash = "sha256-bJ7EieVdM2WQ6yRmsyC+RzLbx2zvlqBoVCWjuBVF8Yc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_trees_ros";
  version = "2.2.2-3";
  src = sources.py_trees_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.setuptools ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs py_trees py_trees_ros_interfaces rcl_interfaces rclpy ros2topic sensor_msgs std_msgs tf2_ros_py unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}