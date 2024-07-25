{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt2,
  mrpt_msgs,
  nav_msgs,
  rosbag2_cpp,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mrpt_rawlog = substituteSource {
      src = fetchgit {
        name = "mrpt_rawlog-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "175fa434bd68fffbaedaae83efb3dccb1d06d706";
        hash = "sha256-J8iXb6VGvbMd+shvFvFVGLWJTrWbRIxxzuh9oBYnNtQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_rawlog";
  version = "2.0.0-1";
  src = sources.mrpt_rawlog;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common cv_bridge mrpt2 mrpt_msgs nav_msgs rosbag2_cpp sensor_msgs tf2_geometry_msgs tf2_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}