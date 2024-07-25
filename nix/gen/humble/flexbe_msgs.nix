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
        rev = "efd657918e781ccea59c225438c299c90643c08e";
        hash = "sha256-EW3SST59gkRYJl6aW5UPXEAKdeZR3WI1VY6PDtCUntU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_msgs";
  version = "2.3.5-1";
  src = sources.flexbe_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
