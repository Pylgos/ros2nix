{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    wrapyfi_ros2_interfaces = substituteSource {
      src = fetchgit {
        name = "wrapyfi_ros2_interfaces-source";
        url = "https://github.com/modular-ml/wrapyfi_ros2_interfaces-release.git";
        rev = "0a1e569618e04ffe690abb47688d2d0bf6551673";
        hash = "sha256-4CRQXZV/6uoHxgAUdBP1LHb3TsZd4yNBCz8uUo2eZVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wrapyfi_ros2_interfaces";
  version = "0.4.30-1";
  src = sources.wrapyfi_ros2_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
