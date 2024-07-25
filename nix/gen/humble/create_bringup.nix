{
  ament_cmake,
  buildRosPackage,
  create_description,
  create_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  joy_teleop,
  launch_xml,
  substituteSource,
}:
let
  sources = rec {
    create_bringup = substituteSource {
      src = fetchgit {
        name = "create_bringup-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "94f016770a93904f1bb6a84830d2a83f3a576390";
        hash = "sha256-Zt2int9ROUgsbQMn44KXkAPO0Uauux5/Sayr/6KQ6lU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create_bringup";
  version = "3.1.0-1";
  src = sources.create_bringup;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ create_description create_driver joy joy_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
