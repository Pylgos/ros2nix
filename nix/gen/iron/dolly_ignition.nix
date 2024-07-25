{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2launch,
  ros_ign_bridge,
  ros_ign_gazebo,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly_ignition = substituteSource {
      src = fetchgit {
        name = "dolly_ignition-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "497df28a9ead47bca26436870ddf280ddb873d6e";
        hash = "sha256-BGdsjbemIWS94BjSHjDClK1ui6sM17J0lJlrhfhj/Vg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_ignition";
  version = "0.4.0-5";
  src = sources.dolly_ignition;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow ros2launch ros_ign_bridge ros_ign_gazebo rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
