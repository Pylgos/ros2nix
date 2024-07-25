{
  ament_cmake,
  buildRosPackage,
  dbw_fca_can,
  dbw_fca_description,
  dbw_fca_joystick_demo,
  dbw_fca_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    dbw_fca = substituteSource {
      src = fetchgit {
        name = "dbw_fca-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "113a513aca449c0cffd94f8ca30f64eda87be574";
        hash = "sha256-hXALq6WGfb5YfH6GF8y7dpa2DMb1P/LwcGeXRfVnUWg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dbw_fca";
  version = "2.1.16-1";
  src = sources.dbw_fca;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dbw_fca_can dbw_fca_description dbw_fca_joystick_demo dbw_fca_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
