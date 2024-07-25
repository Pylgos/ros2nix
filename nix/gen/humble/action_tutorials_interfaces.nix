{
  action_msgs,
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
    action_tutorials_interfaces = substituteSource {
      src = fetchgit {
        name = "action_tutorials_interfaces-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "a4cf77b0ac7f64ffe5359485b5c125eb9938cf24";
        hash = "sha256-9470DihyltAuaj08HLxuboAIVg2ZgSQOZXuqdheUDpI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_interfaces";
  version = "0.20.4-1";
  src = sources.action_tutorials_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
