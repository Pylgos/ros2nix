{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  qt5,
  rviz_common,
  rviz_rendering,
  substituteSource,
  tf2_geometry_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_viz = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "bc944bad94f14582798aa532fb408caf46fea6b1";
        hash = "sha256-HYHBCyopkO52Vb6y6+yx/uQLRYdFAw57uPFeTh/pd98=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_viz";
  version = "1.0.1-4";
  src = sources.fuse_viz;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen fuse_constraints fuse_core fuse_msgs fuse_variables geometry_msgs qt5.qtbase rviz_common rviz_rendering tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
