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
    mobileye_560_660_msgs = substituteSource {
      src = fetchgit {
        name = "mobileye_560_660_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "e8de98737d059f4e2e5b2fef12cb57ecc8ff8283";
        hash = "sha256-VUBlCZa6YHrHj0N2L4MPJZXOD74+Uu4leG3oXg1ZOJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mobileye_560_660_msgs";
  version = "4.0.0-4";
  src = sources.mobileye_560_660_msgs;
  nativeBuildInputs = [ ament_cmake ros_environment rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}