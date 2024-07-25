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
        rev = "3dfd000d786984a64367f949c0cda588a53544d1";
        hash = "sha256-I5AhlHZOcyQJj4ogZ+2Y/5GLON4+GL5Gi+GSn0pp9hM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dummy_map_server";
  version = "0.27.1-1";
  src = sources.dummy_map_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
