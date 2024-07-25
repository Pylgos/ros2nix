{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  qt5,
  rclcpp,
  rviz_common,
  rviz_default_plugins,
  rviz_ogre_vendor,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz2 = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "2c9c7dfe4420825209c96dfd037739e48e21ec7d";
        hash = "sha256-ZZEv2hJO7I4RG7hfranl2iH/eZKaA7RuCV6KpqjHAKg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz2";
  version = "11.2.12-1";
  src = sources.rviz2;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qt5.qtbase rviz_common rviz_default_plugins rviz_ogre_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
