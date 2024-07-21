{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap,
  octomap_msgs,
  qt5,
  rclcpp,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
}:
let
  sources = rec {
    octomap_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "octomap_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
        rev = "8b7865753aa980c533a47ea45d8bedc54743ed20";
        hash = "sha256-M9xdQSP9dc1bw2Jkn7tJ506Ah5/lABFrjFf03Ot8828=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_rviz_plugins";
  version = "2.0.0-5";
  src = sources.octomap_rviz_plugins;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap octomap_msgs qt5.qtbase rclcpp rviz_common rviz_default_plugins rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
