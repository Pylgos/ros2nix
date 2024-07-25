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
        rev = "3763a385efd3e2fa46538998979b6cfd735210b9";
        hash = "sha256-/VjQNf0+j/8vNDOUQZSSa42UXBhoydasX2zQITsJ0ew=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_attribute_msgs";
  version = "0.3.0-1";
  src = sources.soccer_vision_attribute_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
