{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_cbg_executor = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_cbg_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "54edf79326a3beab7d7e692d546bbf81248124c5";
        hash = "sha256-zkBh1/LRht15Ny/7GlhjmkyFTSy8KhxLxTxgX/x32ok=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_cbg_executor";
  version = "0.18.0-2";
  src = sources.examples_rclcpp_cbg_executor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
