{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  lifecycle_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    canopen_core = substituteSource {
      src = fetchgit {
        name = "canopen_core-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "b5f8c4a7930ca81683e36f77bdaad08480dd62ba";
        hash = "sha256-L922kIH+b7VFlHHPRCLzIV6ouwHME/fiM2hB2wtE0i8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_core";
  version = "0.2.11-2";
  src = sources.canopen_core;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_interfaces lely_core_libraries lifecycle_msgs python3Packages.boost rclcpp rclcpp_components rclcpp_lifecycle yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
