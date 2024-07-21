{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  moveit_resources_panda_description,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    moveit_resources_panda_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "f048126f19cacecb1f7c092287c00c0b39bb162e";
        hash = "sha256-G2SAJQ8QFn7N5xCMdzG4MnXGoK2oaVA4NcrLUShEM7A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_panda_moveit_config";
  version = "3.0.0-3";
  src = sources.moveit_resources_panda_moveit_config;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher joint_state_publisher_gui moveit_resources_panda_description robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}