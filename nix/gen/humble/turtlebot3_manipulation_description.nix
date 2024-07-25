{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  robot_state_publisher,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot3_manipulation_description = substituteSource {
      src = fetchgit {
        name = "turtlebot3_manipulation_description-source";
        url = "https://github.com/ros2-gbp/turtlebot3_manipulation-release.git";
        rev = "d14c595fffa1a0ebe7f7c20da599ccdaccdf03e6";
        hash = "sha256-zFQ+e+OEObHqXAXfvpS2BtBgOM/EHrrSQpOG6mqLxJk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_manipulation_description";
  version = "2.1.1-1";
  src = sources.turtlebot3_manipulation_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui robot_state_publisher rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
