{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav2_common,
  nav2_util,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    nav2_velocity_smoother = substituteSource {
      src = fetchgit {
        name = "nav2_velocity_smoother-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "33cedb86642028a6545401116d0286391d179f36";
        hash = "sha256-QpCNeQ0By51fQWzV7LdlV43hP77O1zNB7yCSVW/Cruk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_velocity_smoother";
  version = "1.2.9-1";
  src = sources.nav2_velocity_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_util rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
