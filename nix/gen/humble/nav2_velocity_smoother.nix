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
        rev = "e82949e79bacec85dcfb9cacd1e394453304593e";
        hash = "sha256-405ahraZJ9U0DGK2WqKEmapxCwezbbymjARWfUgaYx4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_velocity_smoother";
  version = "1.1.15-1";
  src = sources.nav2_velocity_smoother;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav2_common nav2_util rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
