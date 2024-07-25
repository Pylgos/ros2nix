{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foros,
  rclcpp,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    foros_examples = substituteSource {
      src = fetchgit {
        name = "foros_examples-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "6ee5fffae4ee5fa9f21e792a9a83423479337693";
        hash = "sha256-wLenaUPYkbTfpUgwP8XyuWRNs7BK+w8XocDjCmIAEZo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foros_examples";
  version = "0.4.1-2";
  src = sources.foros_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ foros rclcpp std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
