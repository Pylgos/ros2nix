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
        rev = "f5c4490cae9ded20d7a5cd8e95c0aa0988a8236a";
        hash = "sha256-8fFH0hYYjzE3bcmDZ+QY+Daw2KPlXvrZ2BB2PC8YNC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim_demos";
  version = "0.244.15-1";
  src = sources.ros_gz_sim_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_transport_plugins robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim rqt_image_view rqt_plot rqt_topic rviz2 sdformat_urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
