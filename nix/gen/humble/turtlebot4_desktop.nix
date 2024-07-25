{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot4_viz,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtlebot4_desktop = substituteSource {
      src = fetchgit {
        name = "turtlebot4_desktop-source";
        url = "https://github.com/ros2-gbp/turtlebot4_desktop-release.git";
        rev = "a35838ecb2a91d884106f74da7a85370280c866e";
        hash = "sha256-R9RZQK2umArCV3tbR4gaUyc7Pfp9cQtFc7Lm+/8d1lU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_desktop";
  version = "1.0.0-1";
  src = sources.turtlebot4_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot4_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
