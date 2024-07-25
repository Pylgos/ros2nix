{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  marti_common_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_nav_msgs = substituteSource {
      src = fetchgit {
        name = "marti_nav_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "95fb7f5683491cf9979d4aa9720d6764f4cc4b58";
        hash = "sha256-pHZeqpnOV1h2FMiPfwJ/JSnqTJvVpfXMgsc7lbZmJLs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_nav_msgs";
  version = "1.5.2-2";
  src = sources.marti_nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs marti_common_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
