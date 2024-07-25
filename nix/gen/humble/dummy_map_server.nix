{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dummy_map_server = substituteSource {
      src = fetchgit {
        name = "dummy_map_server-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "d953fb9b57523e2b3a86964af79eb90f6b5610db";
        hash = "sha256-3IR7McXZkcc0d7/hy1WiEDQgRTzLYezdzJjPOC23Np4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.20.4-1";
  src = sources.dummy_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
