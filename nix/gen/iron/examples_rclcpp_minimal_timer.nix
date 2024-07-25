{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_timer = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_timer-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "e8307aa12aaed93a8a69088fc52fb7ba8f7670f2";
        hash = "sha256-zn5YkxkxQRSdmAlVhS/nwDV/Exb4DrzwVQ9iefeG31w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_timer";
  version = "0.18.0-2";
  src = sources.examples_rclcpp_minimal_timer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
