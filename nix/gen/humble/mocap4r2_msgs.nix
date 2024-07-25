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
  rclcpp,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mocap4r2_msgs = substituteSource {
      src = fetchgit {
        name = "mocap4r2_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2_msgs-release.git";
        rev = "d9ca3d5153da6060508bea9117898a9b3a3882e5";
        hash = "sha256-CG6AX44q0yMZCILaj7TLbs1jMoabZP1W5lA5J8vtGg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_msgs";
  version = "0.0.5-1";
  src = sources.mocap4r2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
