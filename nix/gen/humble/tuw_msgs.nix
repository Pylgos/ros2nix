{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tuw_airskin_msgs,
  tuw_geometry_msgs,
  tuw_multi_robot_msgs,
  tuw_nav_msgs,
  tuw_object_msgs,
}:
let
  sources = rec {
    tuw_msgs = substituteSource {
      src = fetchgit {
        name = "tuw_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "de7549795b10449b95a02f5b631bb7b680aac35a";
        hash = "sha256-pMpT/j8LWDwEmq5RjNfGVaOqlTYXTLbWmjUcAZb3/EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tuw_msgs";
  version = "0.2.1-1";
  src = sources.tuw_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tuw_airskin_msgs tuw_geometry_msgs tuw_multi_robot_msgs tuw_nav_msgs tuw_object_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
