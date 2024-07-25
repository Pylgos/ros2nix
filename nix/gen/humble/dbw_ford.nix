{
  ament_cmake,
  buildRosPackage,
  dbw_ford_can,
  dbw_ford_description,
  dbw_ford_joystick_demo,
  dbw_ford_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dbw_ford = substituteSource {
      src = fetchgit {
        name = "dbw_ford-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "1ad92d87a279432af2189aa5327d513f3ffa8b6d";
        hash = "sha256-mkgwKEHOHfyxe//8VLGI6Od7Meattp9eEi+E0JCFO0A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_ford";
  version = "2.1.16-1";
  src = sources.dbw_ford;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dbw_ford_can dbw_ford_description dbw_ford_joystick_demo dbw_ford_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
