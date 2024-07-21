{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclcpp,
  sqlite,
  sqlite3_vendor,
  substituteSource,
  warehouse_ros,
}:
let
  sources = rec {
    warehouse_ros_sqlite = substituteSource {
      src = fetchgit {
        name = "warehouse_ros_sqlite-source";
        url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release.git";
        rev = "9170d2ce31e93b0181aa16d138012d5a8d2f1bbe";
        hash = "sha256-JavUpzsS5NkJHqZj/lSXLsAOzHX5D/KrEHOhGM/AgLc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "warehouse_ros_sqlite";
  version = "1.0.3-4";
  src = sources.warehouse_ros_sqlite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ python3Packages.boost sqlite sqlite3_vendor ];
  propagatedBuildInputs = [ class_loader rclcpp sqlite warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
