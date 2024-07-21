{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_sim_vendor,
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
        rev = "959d822540f9a06904afa36634bf6c0e7b4c9fa0";
        hash = "sha256-ow1ehDLjDN8AcpsUEs81QuVRD8qcuRPkFKHX6sXmquE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim_demos";
  version = "1.0.0-1";
  src = sources.ros_gz_sim_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_sim_vendor image_transport_plugins robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim rqt_image_view rqt_plot rqt_topic rviz2 sdformat_urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
