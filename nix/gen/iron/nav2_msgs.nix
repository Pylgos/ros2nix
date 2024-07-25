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
        rev = "fb5e997eab5da9cbd23617d7f3d35e7efddb60fc";
        hash = "sha256-elbspkPlT4kG2s95IlATwTiXeFPnmzByR3feI55ZfTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_msgs";
  version = "1.2.9-1";
  src = sources.nav2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geographic_msgs geometry_msgs nav2_common nav_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
