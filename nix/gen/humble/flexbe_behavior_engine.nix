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
        rev = "7742a0846527765a4073d67161c20c3b9ef36006";
        hash = "sha256-ffrz8/ky2t4Z0i4IyqWcQF3ys0TTehafAgv9VXo0L9E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_behavior_engine";
  version = "2.3.5-1";
  src = sources.flexbe_behavior_engine;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_input flexbe_mirror flexbe_msgs flexbe_onboard flexbe_states flexbe_testing flexbe_widget ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
