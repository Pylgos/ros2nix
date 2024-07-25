{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dummy_sensors = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9d1930910448ac560526d85969ec12b40c133e9b";
        hash = "sha256-yzbg/Ek8wvy8eUwYft1EglSOvdtzHMvzXR/2bTwqeco=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_sensors";
  version = "0.20.4-1";
  src = sources.dummy_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
