{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_lola_command_msgs,
  nao_lola_sensor_msgs,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    nao_lola_client = substituteSource {
      src = fetchgit {
        name = "nao_lola_client-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "c81a45165ab9fa279a5a60509cf97db5c2a31b15";
        hash = "sha256-EC4It9qdpgQxnpVxErStgFzOy5Uq4NCqJ4mbwm4CWjk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_client";
  version = "1.3.0-2";
  src = sources.nao_lola_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_lola_command_msgs nao_lola_sensor_msgs python3Packages.boost rcl_interfaces rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}