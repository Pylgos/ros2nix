{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_msgs,
  qt5,
  rclcpp,
  rviz_common,
  rviz_default_plugins,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    octomap_rviz_plugins = substituteSource {
      src = fetchgit {
        name = "octomap_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
        rev = "436b15e68b80022830c0ef2c2bfa93acc3a89dc7";
        hash = "sha256-jYZZwVA/LByiBlY+KXs0ETYwsDlvq8yjFj31QoHrvM0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_rviz_plugins";
  version = "2.1.0-1";
  src = sources.octomap_rviz_plugins;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap_msgs qt5.qtbase rclcpp rviz_common rviz_default_plugins rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
