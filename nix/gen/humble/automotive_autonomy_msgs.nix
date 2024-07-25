{
  ament_cmake,
  automotive_navigation_msgs,
  automotive_platform_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    automotive_autonomy_msgs = substituteSource {
      src = fetchgit {
        name = "automotive_autonomy_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "5880c3cc38021677950701ebac2d2ac0c0b665c1";
        hash = "sha256-R/GduU+VD3B9INpzOpa84Bl42xFAtGthn8PEt8iYmpw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "automotive_autonomy_msgs";
  version = "3.0.4-3";
  src = sources.automotive_autonomy_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ automotive_navigation_msgs automotive_platform_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
