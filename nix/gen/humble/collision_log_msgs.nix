{
  ament_cmake,
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
    collision_log_msgs = substituteSource {
      src = fetchgit {
        name = "collision_log_msgs-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "0df00e7cad19dac73cfbcaa07a7cea3770cc0a9a";
        hash = "sha256-ouuKYvHteOpcCMce+5D73sHmFtv4hiMqMtA5H4rzkZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "collision_log_msgs";
  version = "0.1.1-1";
  src = sources.collision_log_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
