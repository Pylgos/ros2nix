{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport_plugins,
  robot_state_publisher,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  rqt_image_view,
  rqt_plot,
  rqt_topic,
  rviz2,
  sdformat_urdf,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ros_gz_sim_demos = substituteSource {
      src = fetchgit {
        name = "ros_gz_sim_demos-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "98ee61bbd67f0e4d89854d51c9c8f56a77d03e20";
        hash = "sha256-KTd1mv6cPXJqOi/D4IBtEr3T+rGuo0Y5C9aX1xZAy4w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim_demos";
  version = "0.254.1-1";
  src = sources.ros_gz_sim_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport_plugins robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim rqt_image_view rqt_plot rqt_topic rviz2 sdformat_urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
