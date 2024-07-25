{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    kobuki_ros_interfaces = substituteSource {
      src = fetchgit {
        name = "kobuki_ros_interfaces-source";
        url = "https://github.com/ros2-gbp/kobuki_ros_interfaces-release.git";
        rev = "430148d8e452bff18f5e5a507842eb130e745879";
        hash = "sha256-svbQG6e1o4u1HncdcNcx55XoYK99I02G7CxL2jvBZhs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kobuki_ros_interfaces";
  version = "1.0.0-4";
  src = sources.kobuki_ros_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
