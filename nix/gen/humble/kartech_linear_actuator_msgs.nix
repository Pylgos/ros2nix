{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    kartech_linear_actuator_msgs = substituteSource {
      src = fetchgit {
        name = "kartech_linear_actuator_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "fb86137b8f8efb4b789b90ea9e0e741fa9be67c5";
        hash = "sha256-Xad77u1Iv7LJdsdK8vW1H475ls/kjnSvZbln4wUXpmQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kartech_linear_actuator_msgs";
  version = "4.0.0-1";
  src = sources.kartech_linear_actuator_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
