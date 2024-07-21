{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_msgs,
  leo_teleop,
  substituteSource,
}:
let
  sources = rec {
    leo = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "096460a339bcbe739b5becd7655b304416b02fc4";
        hash = "sha256-qRmRxzhzTgwKSELlVR4rhl4PT3KhP04L3wJCEVsnpSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo";
  version = "3.0.3-1";
  src = sources.leo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_description leo_msgs leo_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}