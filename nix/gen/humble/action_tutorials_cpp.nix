{
  action_tutorials_interfaces,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_cpp = substituteSource {
      src = fetchgit {
        name = "action_tutorials_cpp-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "e10618bb7c9ff13e378a3d38813d61e9f1d9284b";
        hash = "sha256-wN4HP6iaAEkqzM83Zx9XUBRZ+czGmAI19DzvO6S3rVo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_cpp";
  version = "0.20.4-1";
  src = sources.action_tutorials_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclcpp rclcpp_action rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
