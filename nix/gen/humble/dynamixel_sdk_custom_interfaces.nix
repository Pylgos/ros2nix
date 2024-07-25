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
    dynamixel_sdk_custom_interfaces = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_custom_interfaces-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "e6a539548e8f5eaa6eb816db19c909aa262adc48";
        hash = "sha256-0ULRyYvvOb1009hbk089LlDrLoGyLZOEloGTCjs66/8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_sdk_custom_interfaces";
  version = "3.7.60-1";
  src = sources.dynamixel_sdk_custom_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
