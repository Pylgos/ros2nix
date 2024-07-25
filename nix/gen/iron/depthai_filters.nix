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
        rev = "f676a7db7541877e4fc3a71d8f4c620e2c201afd";
        hash = "sha256-cGnOX4tgp7Q5jpIDc9kemVPxRPHQHqxvSohMMjNkh0o=";
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
