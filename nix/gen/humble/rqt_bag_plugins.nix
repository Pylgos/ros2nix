{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  rosbag2,
  rqt_bag,
  rqt_gui,
  rqt_gui_py,
  rqt_plot,
  sensor_msgs,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_bag_plugins = substituteSource {
      src = fetchgit {
        name = "rqt_bag_plugins-source";
        url = "https://github.com/ros2-gbp/rqt_bag-release.git";
        rev = "e540c82c7b02c96d01e35910f4f082400aab3b01";
        hash = "sha256-wH3Nt9Ah/SUETlV8jPl0w3SUZdFvugr6GDWfiXtpKiU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag_plugins";
  version = "1.1.5-1";
  src = sources.rqt_bag_plugins;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.pillow python3Packages.pycairo rclpy rosbag2 rqt_bag rqt_gui rqt_gui_py rqt_plot sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
