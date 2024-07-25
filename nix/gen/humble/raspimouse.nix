{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav_msgs,
  raspimouse_msgs,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    raspimouse = substituteSource {
      src = fetchgit {
        name = "raspimouse-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "e7f815007fd18bae7aa8066b4e30b31aa27fa431";
        hash = "sha256-9K6T6sA1HWGNM8FyRTucX/wGCCSFiR2f5V/ziMlTwvk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse";
  version = "1.1.2-1";
  src = sources.raspimouse;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs lifecycle_msgs nav_msgs raspimouse_msgs rclcpp rclcpp_components rclcpp_lifecycle std_msgs std_srvs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
