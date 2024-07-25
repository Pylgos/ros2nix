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
        rev = "647267fd8222e8823123334fc8133f9a4dc2b7a1";
        hash = "sha256-bLQzBOaQ2AgcW/nho3XL9j4iSYR1Y5Ne05AkI0Ey8ns=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_msgs";
  version = "0.1.0-1";
  src = sources.soccer_vision_3d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime soccer_vision_attribute_msgs vision_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
