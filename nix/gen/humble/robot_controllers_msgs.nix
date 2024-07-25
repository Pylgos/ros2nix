{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    robot_controllers_msgs = substituteSource {
      src = fetchgit {
        name = "robot_controllers_msgs-source";
        url = "https://github.com/fetchrobotics-gbp/robot_controllers-ros2-release.git";
        rev = "c87a19cec79fdb3b63170dd9fda11b7e0a93ae23";
        hash = "sha256-utKROZ18GIYSRr1eO7wR5SHfPu2qKiX38fAMIqeqwwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_controllers_msgs";
  version = "0.9.3-1";
  src = sources.robot_controllers_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
