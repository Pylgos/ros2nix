{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot3_fake_node,
  turtlebot3_gazebo,
}:
let
  sources = rec {
    turtlebot3_simulations = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "fd663dd2fbc9bf20a11ab1e95292d8bbbf940844";
        hash = "sha256-W+h1Fb5Y9PXr/M12d+YOfwxWR1QaArnZtIDmkpQ95xI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_simulations";
  version = "2.2.5-3";
  src = sources.turtlebot3_simulations;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot3_fake_node turtlebot3_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
