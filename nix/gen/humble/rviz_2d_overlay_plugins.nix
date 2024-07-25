{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rviz_2d_overlay_msgs,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  std_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rviz_2d_overlay_plugins = substituteSource {
      src = fetchgit {
        name = "rviz_2d_overlay_plugins-source";
        url = "https://github.com/ros2-gbp/rviz_2d_overlay_plugins-release.git";
        rev = "cbf99f35a37dfaeac9f0c28098e5d0a3b16e4810";
        hash = "sha256-5KPjUMZyqAgUXuO87e61O6tTFRDf9qA4oCK56AOXXPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_2d_overlay_plugins";
  version = "1.3.0-1";
  src = sources.rviz_2d_overlay_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rviz_2d_overlay_msgs rviz_common rviz_ogre_vendor rviz_rendering std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
