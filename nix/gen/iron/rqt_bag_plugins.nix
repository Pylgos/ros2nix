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
        rev = "8b8b069149612bfe1b527a6d4f42f95075692c65";
        hash = "sha256-dBBeKAkfqkQ84yaT/nK0uzz74a/wUX1mxkNOKXJIz/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_bag_plugins";
  version = "1.3.4-1";
  src = sources.rqt_bag_plugins;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.pillow python3Packages.pycairo rclpy rosbag2 rqt_bag rqt_gui rqt_gui_py rqt_plot sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
