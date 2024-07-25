{
  ament_cmake,
  ament_cmake_black,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  spinnaker_camera_driver,
  substituteSource,
}:
let
  sources = rec {
    spinnaker_synchronized_camera_driver = substituteSource {
      src = fetchgit {
        name = "spinnaker_synchronized_camera_driver-source";
        url = "https://github.com/ros-drivers-gbp/flir_camera_driver-release.git";
        rev = "ca3698d5e550a1c6cc5e010ef9f22df9c7c69a89";
        hash = "sha256-NwoI3l7TF3gElUY5i0CA+0yjANo36BVi2H+ABLsH0X0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_synchronized_camera_driver";
  version = "2.1.17-1";
  src = sources.spinnaker_synchronized_camera_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components spinnaker_camera_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
