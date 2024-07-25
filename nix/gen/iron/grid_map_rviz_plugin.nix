{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_msgs,
  grid_map_ros,
  qt5,
  rclcpp,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map_rviz_plugin = substituteSource {
      src = fetchgit {
        name = "grid_map_rviz_plugin-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "978ce5a4d10e41d86626d26f23e9adc45bc4539e";
        hash = "sha256-RSnlvo1CFK+nUNk1UHrH6TIp2JYUD1VMEVZ0bubjng4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_rviz_plugin";
  version = "2.1.0-1";
  src = sources.grid_map_rviz_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros qt5.qtbase rclcpp rviz_common rviz_ogre_vendor rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
