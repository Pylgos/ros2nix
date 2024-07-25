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
        rev = "8933049216d3bed4519abe3e42cffdffc92690a5";
        hash = "sha256-kP7RTHIBMzCh+9x1X1nolk74ZRdCZt1JdperdUkjuU4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_sim_demos";
  version = "1.0.1-1";
  src = sources.ros_gz_sim_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_sim_vendor image_transport_plugins robot_state_publisher ros_gz_bridge ros_gz_image ros_gz_sim rqt_image_view rqt_plot rqt_topic rviz2 sdformat_urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
