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
        rev = "1c553cdb4973c9c35e48a2f680b24dd3a0bcce7e";
        hash = "sha256-5bv6GU74eEcGiHwRHJTAdP+mjDTM6oxzcw0NyT07xi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_sensor_msgs";
  version = "0.1.0-1";
  src = sources.nao_sensor_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
