{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ouxt_lint_common,
  rclcpp,
  rviz2,
  std_msgs,
  substituteSource,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    color_names = substituteSource {
      src = fetchgit {
        name = "color_names-source";
        url = "https://github.com/ros2-gbp/color_names-release.git";
        rev = "545ffe1ff93df829fe5cf4b6d75bfc6bdf6dca17";
        hash = "sha256-956LQvQPv4QtQBKeDL62YimdLDh1yLGsi9AYgWiBh/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "color_names";
  version = "0.0.3-5";
  src = sources.color_names;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rviz2 std_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
