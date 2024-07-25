{
  ament_clang_format,
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flex_sync = substituteSource {
      src = fetchgit {
        name = "flex_sync-source";
        url = "https://github.com/ros2-gbp/flex_sync-release.git";
        rev = "b48e69145cf8b9d30171480eb9a9f151c1a2897b";
        hash = "sha256-DRj8hRb5f02ZdXinTOUCOnVQRMHJS/Es67wgVFdZmUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flex_sync";
  version = "2.0.0-1";
  src = sources.flex_sync;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_clang_format rclcpp rclcpp_components rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
