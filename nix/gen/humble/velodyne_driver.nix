{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  libpcap,
  rclcpp,
  rclcpp_components,
  substituteSource,
  tf2_ros,
  velodyne_msgs,
}:
let
  sources = rec {
    velodyne_driver = substituteSource {
      src = fetchgit {
        name = "velodyne_driver-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "5d5a0f30230e5a5e8fee0e456eaec849e651f3b2";
        hash = "sha256-AZ1ydV3ClKtOIc4quCW/nxvkPLklZNs//OZAiybdmP4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_driver";
  version = "2.4.0-1";
  src = sources.velodyne_driver;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater libpcap rclcpp rclcpp_components tf2_ros velodyne_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
