{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  gazebo_video_monitor_interfaces,
  opencv,
  rclcpp,
  std_srvs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    gazebo_video_monitor_plugins = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_plugins-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "f7c246c80e3917e4def873beab42514af1697a46";
        hash = "sha256-KEzqnS0nZ9GatgieuIlhG9OC9WOEN5xNCys7JtkZzsk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_video_monitor_plugins";
  version = "0.8.1-1";
  src = sources.gazebo_video_monitor_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros gazebo_video_monitor_interfaces opencv rclcpp std_srvs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
