{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pluginlib,
  rviz_common,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    snowbot_operating_system = substituteSource {
      src = fetchgit {
        name = "snowbot_operating_system-source";
        url = "https://github.com/ros2-gbp/snowbot_release.git";
        rev = "afd3d7236851374e05f4c011d12efba81c85b628";
        hash = "sha256-jsc6W+E4XVtTLGd+ZSn45ChfZmV6/c9nUg1FpqA6d8s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "snowbot_operating_system";
  version = "0.1.2-3";
  src = sources.snowbot_operating_system;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs pluginlib rviz_common rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
