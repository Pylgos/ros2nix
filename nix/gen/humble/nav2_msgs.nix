{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav_msgs,
  rclcpp,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav2_msgs = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "07cf7ca8cbc7795ac9e6fec5d78b88e677b319b0";
        hash = "sha256-4gwp+p81TlzFUQebkpcc5iOOQXaThXnvxQ+dBwyhGSQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_msgs";
  version = "1.1.15-1";
  src = sources.nav2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geometry_msgs nav2_common nav_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
