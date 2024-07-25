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
    soccer_vision_attribute_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_vision_attribute_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "db7f8c2824d86cd51561fd76b6e2c0cf78be0c13";
        hash = "sha256-3YI3tO0R3y6nA1z66Tg0Eusoa9vpxWc2tpSRHAMoHfI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_attribute_msgs";
  version = "0.1.0-1";
  src = sources.soccer_vision_attribute_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
