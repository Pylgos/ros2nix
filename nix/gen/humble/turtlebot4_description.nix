{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_description,
  joint_state_publisher,
  robot_state_publisher,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    turtlebot4_description = substituteSource {
      src = fetchgit {
        name = "turtlebot4_description-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "8ef30de134581fe06795fd95959fc43f37844169";
        hash = "sha256-jwXqVb98y1VCy7AfHLhf+DJNWzkGNAgFXT7Z17fxQdA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_description";
  version = "1.0.5-1";
  src = sources.turtlebot4_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_description joint_state_publisher robot_state_publisher urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
