{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  robot_state_publisher,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    andino_description = substituteSource {
      src = fetchgit {
        name = "andino_description-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "fc0d2c229d08bd1b3d5bcf51f533e5465711bc6c";
        hash = "sha256-jJAmuLSm2yxZqY3uTK0GFq9EfNbpi3B2n6x9/d9pHE8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_description";
  version = "0.1.0-1";
  src = sources.andino_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui robot_state_publisher ros2launch rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
