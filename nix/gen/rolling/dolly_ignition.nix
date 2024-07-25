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
        rev = "36b5774da731136a6fc4bf5dc57c9f29a437a371";
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
  propagatedBuildInputs = [ dolly_follow ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}