{
  ament_cmake,
  buildRosPackage,
  ds_dbw_can,
  ds_dbw_joystick_demo,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw = substituteSource {
      src = fetchgit {
        name = "ds_dbw-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "92f3b37cd20b3167a249bd1477dea163c19c56ce";
        hash = "sha256-0RhO4B8IIoKgJ2aZkKbTBHpdI6RRMaoUrP/+h56RHDE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw";
  version = "2.1.16-1";
  src = sources.ds_dbw;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ds_dbw_can ds_dbw_joystick_demo ds_dbw_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
