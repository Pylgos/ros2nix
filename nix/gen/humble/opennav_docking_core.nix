{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_util,
  opennav_docking_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    opennav_docking_core = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "e3c499abca5cbebc009c05f9195422f696599784";
        hash = "sha256-r1sDio8gOpguE0+mJ2WqRam32C2BcfWx+F1cp6WzITg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "opennav_docking_core";
  version = "0.0.2-4";
  src = sources.opennav_docking_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav2_util opennav_docking_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
