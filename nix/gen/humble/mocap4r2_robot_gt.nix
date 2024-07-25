{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mocap4r2_msgs,
  mocap4r2_robot_gt_msgs,
  rclcpp,
  rclcpp_components,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    mocap4r2_robot_gt = substituteSource {
      src = fetchgit {
        name = "mocap4r2_robot_gt-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "853ea5aaed973f159a550229010e271f48d6b04b";
        hash = "sha256-cv35GYqUQm8IV5yGNdZczIfb/p0nT56i6lDXezRyhJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_robot_gt";
  version = "0.0.7-1";
  src = sources.mocap4r2_robot_gt;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mocap4r2_msgs mocap4r2_robot_gt_msgs rclcpp rclcpp_components tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
