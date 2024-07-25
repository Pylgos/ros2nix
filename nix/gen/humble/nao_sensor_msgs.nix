{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    nao_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "nao_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/nao_interfaces-release.git";
        rev = "49b38dc041758a1e9adb51c108267631493fef0e";
        hash = "sha256-voblmIZEbFn+LhZA1F3qn0v2jO6Jgj7uOi9/OaDhQkE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_sensor_msgs";
  version = "0.0.5-1";
  src = sources.nao_sensor_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
