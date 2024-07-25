{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    adaptive_component = substituteSource {
      src = fetchgit {
        name = "adaptive_component-source";
        url = "https://github.com/ros2-gbp/adaptive_component-release.git";
        rev = "d02767b88396cd734926ccd6c08cdae656c6bb65";
        hash = "sha256-W7/vGlSCfAW+RH7nsv4Po+MFZLDvwzuq/iSATbF9jaQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "adaptive_component";
  version = "0.2.1-2";
  src = sources.adaptive_component;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}