{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_resources_prbt_ikfast_manipulator_plugin,
  moveit_resources_prbt_moveit_config,
  moveit_resources_prbt_support,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_pg70_support = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8a93483491df6287913cc30b80d60c00792438e3";
        hash = "sha256-YgSUHjNESYfupmP1k6KBFf8f0uYFnz5vzmnS4SrKyVE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_pg70_support";
  version = "2.5.5-1";
  src = sources.moveit_resources_prbt_pg70_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_moveit_config moveit_resources_prbt_support xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
