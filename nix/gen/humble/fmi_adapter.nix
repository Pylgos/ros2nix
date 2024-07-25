{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmilibrary_vendor,
  launch,
  launch_ros,
  launch_testing,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rcutils,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter = substituteSource {
      src = fetchgit {
        name = "fmi_adapter-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "602e6041cfff0fddf127e4db8ed1ca9ca04c6c03";
        hash = "sha256-pC2a5q3fbSAGFRlotIahHSzRm+tJOBSAjho9Q70/otU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter";
  version = "2.1.1-1";
  src = sources.fmi_adapter;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmilibrary_vendor launch_ros rcl_interfaces rclcpp rclcpp_components rclcpp_lifecycle std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
