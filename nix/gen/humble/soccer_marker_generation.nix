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
  soccer_object_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    soccer_marker_generation = substituteSource {
      src = fetchgit {
        name = "soccer_marker_generation-source";
        url = "https://github.com/ros2-gbp/soccer_visualization-release.git";
        rev = "01da0b4dbb28210916847d97feab66618ec23347";
        hash = "sha256-3P3fmHnpeTlaI9ykWoLBv5F8HGk9vEReSDRKIvZum+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_marker_generation";
  version = "0.0.2-3";
  src = sources.soccer_marker_generation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp soccer_object_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
