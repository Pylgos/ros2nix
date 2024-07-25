{
  ament_cmake,
  buildRosPackage,
  dbw_polaris_can,
  dbw_polaris_description,
  dbw_polaris_joystick_demo,
  dbw_polaris_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dbw_polaris = substituteSource {
      src = fetchgit {
        name = "dbw_polaris-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "c433de50d1050f2671be6531a828718bbfaebef9";
        hash = "sha256-A2fmKjGlIAKo7gV34uwz7p9Xy+3kb9slBNQi6bohSTg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_polaris";
  version = "2.1.16-1";
  src = sources.dbw_polaris;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dbw_polaris_can dbw_polaris_description dbw_polaris_joystick_demo dbw_polaris_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
