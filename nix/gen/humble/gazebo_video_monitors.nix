{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_video_monitor_interfaces,
  gazebo_video_monitor_plugins,
  gazebo_video_monitor_utils,
  substituteSource,
}:
let
  sources = rec {
    gazebo_video_monitors = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitors-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "e14ac23a85910ece7e25ba527b4a7e6bdfd79e24";
        hash = "sha256-MouczI+rHNvxvkkP86XJK8CFh21DekZYPpUqUSj5eJ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_video_monitors";
  version = "0.8.1-1";
  src = sources.gazebo_video_monitors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_video_monitor_interfaces gazebo_video_monitor_plugins gazebo_video_monitor_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
