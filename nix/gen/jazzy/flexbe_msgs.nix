{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
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
    flexbe_msgs = substituteSource {
      src = fetchgit {
        name = "flexbe_msgs-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "a5d7f9f1c81ae33f3c3c2fb01e0721bb2bdd926a";
        hash = "sha256-uBMqKj7xP+bWHd1rLyL8C2Tx+/vWfPi7wrtzjqmywGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_msgs";
  version = "3.0.3-1";
  src = sources.flexbe_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
