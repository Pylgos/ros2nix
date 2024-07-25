{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mocap4r2_marker_viz_srvs,
  mocap4r2_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    mocap4r2_marker_viz = substituteSource {
      src = fetchgit {
        name = "mocap4r2_marker_viz-source";
        url = "https://github.com/MOCAP4ROS2-Project/mocap4r2-release.git";
        rev = "4009b1f15ce6e03e2e4c8135493424667ec8c2d1";
        hash = "sha256-3BCd4Qhmx74G56gC6jtZ29KIVYYXmeeR6zoAWIivbKI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mocap4r2_marker_viz";
  version = "0.0.7-1";
  src = sources.mocap4r2_marker_viz;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mocap4r2_marker_viz_srvs mocap4r2_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
