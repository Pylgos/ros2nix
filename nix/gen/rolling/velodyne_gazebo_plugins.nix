{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "3eb6dc96fab18b1f0fa24edc275a0c90cf8a7a2e";
        hash = "sha256-TFxh7d/7+m5z05amlR634rbaqZYAHs06SxUx3ZlM/NI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_gazebo_plugins";
  version = "2.0.3-3";
  src = sources.velodyne_gazebo_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}