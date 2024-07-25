{
  ament_clang_format,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_resources_fanuc_description,
  moveit_setup_framework,
  pluginlib,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_srdf_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2f6c18f64a5b30291b170021af8ab3dba95a113f";
        hash = "sha256-te+zRUMWJgG0eHc8q6dS88iC4DIwph9dvLkx1nh1zwE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_srdf_plugins";
  version = "2.5.5-1";
  src = sources.moveit_setup_srdf_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_setup_framework pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
