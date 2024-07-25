{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  interactive_markers,
  rclcpp,
  substituteSource,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    interactive_marker_twist_server = substituteSource {
      src = fetchgit {
        name = "interactive_marker_twist_server-source";
        url = "https://github.com/ros-gbp/interactive_marker_twist_server-release.git";
        rev = "c2286aec698e712ba72d5d2953920b13fecaf802";
        hash = "sha256-FvPQhN5z6jkYZtScraxOUe3bjI3cA495ni/sp/Hh7uk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "interactive_marker_twist_server";
  version = "2.1.0-1";
  src = sources.interactive_marker_twist_server;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs interactive_markers rclcpp tf2 visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
