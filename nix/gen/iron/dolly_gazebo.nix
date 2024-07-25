{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dolly_follow,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros_pkgs,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dolly_gazebo = substituteSource {
      src = fetchgit {
        name = "dolly_gazebo-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "26d07363a95a1e8b77ea33ed59b8983d6866406f";
        hash = "sha256-sLCbhJjIRzZvq15SlStZjonIvhpPw57fK5vRlQ3689A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_gazebo";
  version = "0.4.0-5";
  src = sources.dolly_gazebo;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dolly_follow gazebo_ros_pkgs ros2launch rviz2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
