{
  ament_cmake,
  buildRosPackage,
  camera_info_manager,
  composition_interfaces,
  cv_bridge,
  depthai,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  opencv,
  python3Packages,
  rclcpp,
  robot_state_publisher,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  vision_msgs,
  xacro,
}:
let
  sources = rec {
    depthai_bridge = substituteSource {
      src = fetchgit {
        name = "depthai_bridge-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "0e2a77d8753ae1aa16251a68c7139f55ce74b9c9";
        hash = "sha256-VenFudpsVNdPZ7N3q4j1Oud2YPPkDwBK5v4/crLysWo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_bridge";
  version = "2.9.0-1";
  src = sources.depthai_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ camera_info_manager composition_interfaces cv_bridge depthai depthai_ros_msgs image_transport opencv python3Packages.boost rclcpp robot_state_publisher sensor_msgs std_msgs stereo_msgs tf2 tf2_geometry_msgs tf2_ros vision_msgs xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
