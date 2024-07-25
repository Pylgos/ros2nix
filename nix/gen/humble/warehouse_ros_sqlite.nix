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
        rev = "c78a424ca5bfc1b62276ea79122f705786b927e5";
        hash = "sha256-JavUpzsS5NkJHqZj/lSXLsAOzHX5D/KrEHOhGM/AgLc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "warehouse_ros_sqlite";
  version = "1.0.3-1";
  src = sources.warehouse_ros_sqlite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ class_loader python3Packages.boost rclcpp sqlite sqlite3_vendor warehouse_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
