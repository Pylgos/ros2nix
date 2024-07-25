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
        rev = "74dded0e1662ddd1fdfe95359a2066528032731d";
        hash = "sha256-z8HBYfJ4SH1kbToGsf6tHPccjImandiilK9gxOLUF90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_sensor_msgs";
  version = "1.0.0-2";
  src = sources.nao_sensor_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}