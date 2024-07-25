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
        rev = "00740e734d600c3c5ed179ae60a7f288a79c2c06";
        hash = "sha256-pHZeqpnOV1h2FMiPfwJ/JSnqTJvVpfXMgsc7lbZmJLs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_nav_msgs";
  version = "1.5.2-1";
  src = sources.marti_nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs marti_common_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
