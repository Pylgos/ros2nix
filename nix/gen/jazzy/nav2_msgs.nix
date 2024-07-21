{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
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
        rev = "b77007d6cc4cc0adc0fa10a114128e682d76c1e8";
        hash = "sha256-DSoCMP13PdjSY8tA4h86qdDA3nOWqHXkPraSTb4p+dA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_msgs";
  version = "1.3.1-1";
  src = sources.nav2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [ nav2_common ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geographic_msgs geometry_msgs nav_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}