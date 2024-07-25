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
        rev = "4f086dedf2989f9227d1d3b447cf75b2bfe7e08b";
        hash = "sha256-7pSoEjWPFwXAfBePp/sLKVBZHWGfSyTQP3fXQvgfmGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_cpp";
  version = "0.27.1-1";
  src = sources.action_tutorials_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclcpp rclcpp_action rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
