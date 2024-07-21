{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt2,
  mrpt_msgs,
  mrpt_nav_interfaces,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  visualization_msgs,
}:
let
  sources = rec {
    mrpt_reactivenav2d = substituteSource {
      src = fetchgit {
        name = "mrpt_reactivenav2d-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "5287aff260b81aba178025561e8e034d67731044";
        hash = "sha256-bG1tBK3tmCfCjoEuyJfALn2hEVUbJdePWEsRv9mccHs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_reactivenav2d";
  version = "2.0.0-1";
  src = sources.mrpt_reactivenav2d;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_lint_auto ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_common geometry_msgs mrpt2 mrpt_msgs mrpt_nav_interfaces nav_msgs rclcpp rclcpp_components sensor_msgs tf2 tf2_geometry_msgs tf2_ros visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
