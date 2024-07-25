{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    radar_msgs = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "68567d47d7e69b7bee65e9d7ed86691fecca899a";
        hash = "sha256-HO0hAoc99su0O3J40Mywg7/qtbQJof/b5/wwBnx6xbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "radar_msgs";
  version = "0.2.2-3";
  src = sources.radar_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
