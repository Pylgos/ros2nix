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
    nao_lola_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "nao_lola_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "5b22506892455f9a1903d28f19bfc11be1725c68";
        hash = "sha256-I+mOw69Qd5OqCcNdvjpOn3LGw/W/7hPl71P0sgF+42k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_sensor_msgs";
  version = "1.3.0-1";
  src = sources.nao_lola_sensor_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
