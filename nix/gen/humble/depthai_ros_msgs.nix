{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rosidl_default_generators,
  sensor_msgs,
  std_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    depthai_ros_msgs = substituteSource {
      src = fetchgit {
        name = "depthai_ros_msgs-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "4478bb4e047eb792c515907dd66ac51fdf0cb268";
        hash = "sha256-jMcp7Jt33AtOSstbElQpZ7uussPL5RLd1ol/OPln6CU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_ros_msgs";
  version = "2.9.0-1";
  src = sources.depthai_ros_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp sensor_msgs std_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
