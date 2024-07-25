{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  raspimouse_navigation,
  raspimouse_slam,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    raspimouse_slam_navigation = substituteSource {
      src = fetchgit {
        name = "raspimouse_slam_navigation-source";
        url = "https://github.com/ros2-gbp/raspimouse_slam_navigation_ros2-release.git";
        rev = "07d5603fac2515ad55bb0088e891d76776b0f783";
        hash = "sha256-vuVfKh35KBPaeS1AQQmPdy9lJYdc2urtYmqCrMlwZ90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_slam_navigation";
  version = "2.1.0-1";
  src = sources.raspimouse_slam_navigation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ raspimouse_navigation raspimouse_slam ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
