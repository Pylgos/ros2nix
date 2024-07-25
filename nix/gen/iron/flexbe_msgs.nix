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
        rev = "53b23ceb304937e8dcd73a50d344935401919736";
        hash = "sha256-8j/4V/ByVvn1F5W4LutWjUqC0djZXiXB1gvrES9vspY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_msgs";
  version = "3.0.2-1";
  src = sources.flexbe_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
