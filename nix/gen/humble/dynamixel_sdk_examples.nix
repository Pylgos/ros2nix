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
        rev = "d39394b495973f99bb73240c1336ae45f688d6e9";
        hash = "sha256-xzAdZhQ+uOP/ggF9IAMTcK5A7hHwXPdjaH0EjRYUD3s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_sdk_examples";
  version = "3.7.60-1";
  src = sources.dynamixel_sdk_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk dynamixel_sdk_custom_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
