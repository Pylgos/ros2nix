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
        rev = "1c0062c8205d710fec822b7d0d306687ecac485d";
        hash = "sha256-7VseR5+sOdQqr17e6TmIi3pd49QZfiJrVGY5HGSzdLA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spinnaker_synchronized_camera_driver";
  version = "2.2.17-1";
  src = sources.spinnaker_synchronized_camera_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components spinnaker_camera_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
