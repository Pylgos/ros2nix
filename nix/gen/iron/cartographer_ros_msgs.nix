{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    cartographer_ros_msgs = substituteSource {
      src = fetchgit {
        name = "cartographer_ros_msgs-source";
        url = "https://github.com/ros2-gbp/cartographer_ros-release.git";
        rev = "764a7dd8857c84dafc66ab33fee9c9d6e75420e4";
        hash = "sha256-HWgVBsw215xQ2yHFhP/a+LBucgvz/z+cADxAT2qNGqo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cartographer_ros_msgs";
  version = "2.0.9002-1";
  src = sources.cartographer_ros_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
