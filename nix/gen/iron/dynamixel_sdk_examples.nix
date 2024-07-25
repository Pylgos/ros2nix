{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  dynamixel_sdk,
  dynamixel_sdk_custom_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_sdk_examples = substituteSource {
      src = fetchgit {
        name = "dynamixel_sdk_examples-source";
        url = "https://github.com/ros2-gbp/dynamixel_sdk-release.git";
        rev = "bb0c125b9dfe0168293c9e4aade1e47b367f8f5b";
        hash = "sha256-TRPWVWEEJtx/attfpSr6SATpy7YhzqP9x8ef/IVsULA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_sdk_examples";
  version = "3.7.40-5";
  src = sources.dynamixel_sdk_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk dynamixel_sdk_custom_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
