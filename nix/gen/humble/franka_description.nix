{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    franka_description = substituteSource {
      src = fetchgit {
        name = "franka_description-source";
        url = "https://github.com/ros2-gbp/franka_description-release.git";
        rev = "178c888618b1c79d912b0c92f0913d54fdcfbb13";
        hash = "sha256-SIF14LvlLcoBwxajBNS1emYb43Esu6MaFheA24lrSZs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "franka_description";
  version = "0.2.0-1";
  src = sources.franka_description;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher_gui rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
