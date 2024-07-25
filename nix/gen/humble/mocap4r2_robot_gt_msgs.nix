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
    mocap4r2_robot_gt_msgs = substituteSource {
      src = fetchgit {
        name = "mocap4r2_robot_gt_msgs-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "182e59edd487d177a9cbe24dcd882825b574eddf";
        hash = "sha256-WSc+07t2eKfnv4FnLP3fPtTwMJTEXXyvaPLrHLE/g0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_robot_gt_msgs";
  version = "0.0.7-1";
  src = sources.mocap4r2_robot_gt_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
