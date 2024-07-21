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
  soccer_vision_attribute_msgs,
  substituteSource,
  vision_msgs,
}:
let
  sources = rec {
    soccer_vision_3d_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "53e5c907b54c8767acd236cc367a537656904b95";
        hash = "sha256-mefLwquylSQ8WewNihJ2SMPAIUXP2T1Ye+Q7n9q7b8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_msgs";
  version = "1.0.0-2";
  src = sources.soccer_vision_3d_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime soccer_vision_attribute_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}