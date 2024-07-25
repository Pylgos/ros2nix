{
  ament_cmake,
  buildRosPackage,
  clearpath_platform_description,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher_gui,
  rqt_robot_monitor,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    clearpath_viz = substituteSource {
      src = fetchgit {
        name = "clearpath_viz-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "8be5b721d934a9384253b522d1054f70cdc91585";
        hash = "sha256-4ogO2w9+X9qrKyxVXQeZ7ty8nu3RybbbyV1QsFBB95Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_viz";
  version = "0.1.2-1";
  src = sources.clearpath_viz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_platform_description joint_state_publisher_gui rqt_robot_monitor rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
