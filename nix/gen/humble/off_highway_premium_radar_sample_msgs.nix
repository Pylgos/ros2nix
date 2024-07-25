{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_premium_radar_sample_msgs = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_sample_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "e2d8abc91c16ad1b65fc11abadc7456a6d7c724f";
        hash = "sha256-vcBUUW4KoJnqM2KfJoUETzu4usvRXc5fkLV03szZO9A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_premium_radar_sample_msgs";
  version = "0.6.2-1";
  src = sources.off_highway_premium_radar_sample_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
