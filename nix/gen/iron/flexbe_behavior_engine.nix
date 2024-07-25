{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_input,
  flexbe_mirror,
  flexbe_msgs,
  flexbe_onboard,
  flexbe_states,
  flexbe_testing,
  flexbe_widget,
  substituteSource,
}:
let
  sources = rec {
    flexbe_behavior_engine = substituteSource {
      src = fetchgit {
        name = "flexbe_behavior_engine-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "7eeeb1fd316e1acd99704fbfccf19aaa03d76774";
        hash = "sha256-fF+AiPAFenx5VgF8tMqLqAuenxjfySp08NY/yRdHDGU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_behavior_engine";
  version = "3.0.2-1";
  src = sources.flexbe_behavior_engine;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_input flexbe_mirror flexbe_msgs flexbe_onboard flexbe_states flexbe_testing flexbe_widget ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
