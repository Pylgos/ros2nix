{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_msgs,
  gazebo_ros,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    velodyne_gazebo_plugins = substituteSource {
      src = fetchgit {
        name = "velodyne_gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/velodyne_simulator-release.git";
        rev = "9bd6c3eb7da9490d80492e378b195389ed61fd91";
        hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-1";
  src = sources.velodyne_gazebo_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_msgs gazebo_ros rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
