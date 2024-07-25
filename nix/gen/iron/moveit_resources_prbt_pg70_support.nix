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
        rev = "01193ef01806dea37c87c9883405f96f6cdd8c2e";
        hash = "sha256-mKGBsx9pBmmpM8BdU5IcOaZd/Zf+5FBauZkwqCD6PxM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_pg70_support";
  version = "2.8.0-1";
  src = sources.moveit_resources_prbt_pg70_support;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_moveit_config moveit_resources_prbt_support xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
