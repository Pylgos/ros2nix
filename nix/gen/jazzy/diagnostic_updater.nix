{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_updater = substituteSource {
      src = fetchgit {
        name = "diagnostic_updater-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "065b406337071a2c3de3b53dd1eb3d59a5955644";
        hash = "sha256-NZauvVcfEk5z0VTtOQ431N/ebNLP0wMd7mDfnG+b/GM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_updater";
  version = "3.1.2-3";
  src = sources.diagnostic_updater;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
