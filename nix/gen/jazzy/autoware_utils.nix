{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_utils = substituteSource {
      src = fetchgit {
        name = "autoware_utils-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "4d582d3100af60a9be279e0a93bf70672ba9ab70";
        hash = "sha256-64bVDZx6Rh0NjYj7GrBjcZrD9RGeONzy0Gzq5qQ+1XU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_utils";
  version = "1.0.0-1";
  src = sources.autoware_utils;
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces python3Packages.boost rclcpp unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}