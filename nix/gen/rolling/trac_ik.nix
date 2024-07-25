{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  trac_ik_kinematics_plugin,
  trac_ik_lib,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    trac_ik = substituteSource {
      src = fetchgit {
        name = "trac_ik-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "719a13ffcbf7ecb033165cdd112631c14f8d8b41";
        hash = "sha256-Mi5zU70nYLOrjdiVRLXtTefB9IBLrHv8HpqzxWWRWas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trac_ik";
  version = "2.0.1-1";
  src = sources.trac_ik;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ trac_ik_kinematics_plugin trac_ik_lib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
