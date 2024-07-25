{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    plansys2_lifecycle_manager = substituteSource {
      src = fetchgit {
        name = "plansys2_lifecycle_manager-source";
        url = "https://github.com/ros2-gbp/ros2_planning_system-release.git";
        rev = "aa5d11fb666cda1e55a6c7e6cd078eb2b562927d";
        hash = "sha256-xXiwoQn7zFH5u+lHEeZ4QFY3TRGmno5ye05YVngzgvY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "plansys2_lifecycle_manager";
  version = "2.0.11-1";
  src = sources.plansys2_lifecycle_manager;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
