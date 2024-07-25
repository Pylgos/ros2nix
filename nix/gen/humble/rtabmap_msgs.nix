{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    rtabmap_msgs = substituteSource {
      src = fetchgit {
        name = "rtabmap_msgs-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "0f71cee31cd627a72f879d1ec3624e0cb265348c";
        hash = "sha256-7rObv5E6b5U7ZbUP+lk1aN9ZgzKeUiOstReb9/Fsh1E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_msgs";
  version = "0.21.5-1";
  src = sources.rtabmap_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
