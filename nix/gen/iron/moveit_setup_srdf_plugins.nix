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
        rev = "8de3ac21eb1ebe4a52c956bff40d88c60e4006bf";
        hash = "sha256-7QLIZz7/cs4FQC0ycARkCdyh89yNQzuLW2o6l48tqLw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_srdf_plugins";
  version = "2.8.0-1";
  src = sources.moveit_setup_srdf_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_setup_framework pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
