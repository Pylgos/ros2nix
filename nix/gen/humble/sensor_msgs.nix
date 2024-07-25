{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs = substituteSource {
      src = fetchgit {
        name = "sensor_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "c3efbd1121a5dfae2e5e897ff348fac213cb3131";
        hash = "sha256-3BsEe6E49sdqc4Q7ah9kLYGH582KSQtKOIfxBHgMk0Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs";
  version = "4.2.4-1";
  src = sources.sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
