{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qb_device_bringup,
  qb_device_driver,
  qb_device_msgs,
  qb_device_ros2_control,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qb_device = substituteSource {
      src = fetchgit {
        name = "qb_device-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "9a7604b5a2dd6b2a1866f757a97d2311e8cbb0a5";
        hash = "sha256-RbnIDJEyhkIy5MBulyiaUcb1K/fTuTVacgSAuLzWFEE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device";
  version = "4.1.3-1";
  src = sources.qb_device;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qb_device_bringup qb_device_driver qb_device_msgs qb_device_ros2_control ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
