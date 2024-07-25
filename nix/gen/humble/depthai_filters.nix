{
  ament_cmake_auto,
  buildRosPackage,
  cv_bridge,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  vision_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    depthai_filters = substituteSource {
      src = fetchgit {
        name = "depthai_filters-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "5b430bbabcfde790e5c0a9198f1d751c73d50762";
        hash = "sha256-j6+FIFsynQ3I1KfedwqWKy1Nu8C5/oFbUa4PkeqHVco=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_filters";
  version = "2.9.0-1";
  src = sources.depthai_filters;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge depthai_ros_msgs image_transport message_filters opencv rclcpp rclcpp_components sensor_msgs vision_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
