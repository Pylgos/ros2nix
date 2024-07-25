{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    novatel_gps_msgs = substituteSource {
      src = fetchgit {
        name = "novatel_gps_msgs-source";
        url = "https://github.com/ros2-gbp/novatel_gps_driver-release.git";
        rev = "a5e0b4033b3b2ee97fb7bb439a3fc9263c32bfb0";
        hash = "sha256-kjJ9vONE54WT4ZTXe3G+F0WieULuO/6mgMO3dAFCZGc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "novatel_gps_msgs";
  version = "4.1.2-1";
  src = sources.novatel_gps_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
