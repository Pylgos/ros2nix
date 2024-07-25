{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_pal,
  launch_param_builder,
  launch_ros,
  launch_testing_ament_cmake,
  robot_state_publisher,
  substituteSource,
  urdf_test,
  xacro,
}:
let
  sources = rec {
    human_description = substituteSource {
      src = fetchgit {
        name = "human_description-source";
        url = "https://github.com/ros4hri/human_description-release.git";
        rev = "5fb50ef714fad0657acfe76e3f4e9554435d53df";
        hash = "sha256-qKZ/Ym6+oLJmYECE6OClZuKKhi4uMU0GptbQwAOzcHs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "human_description";
  version = "2.0.2-1";
  src = sources.human_description;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_pal launch_param_builder launch_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
