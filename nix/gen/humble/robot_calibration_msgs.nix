{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    robot_calibration_msgs = substituteSource {
      src = fetchgit {
        name = "robot_calibration_msgs-source";
        url = "https://github.com/ros2-gbp/robot_calibration-release.git";
        rev = "26b77eb57450d9bff68a30c0449899f76eb38b9e";
        hash = "sha256-93hQD9lfwzXpIziWF/APBHJ19Ybr2ZSSaDPH8whgCrE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_calibration_msgs";
  version = "0.8.1-1";
  src = sources.robot_calibration_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
