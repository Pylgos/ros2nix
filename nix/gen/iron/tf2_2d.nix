{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    tf2_2d = substituteSource {
      src = fetchgit {
        name = "tf2_2d-source";
        url = "https://github.com/ros2-gbp/tf2_2d-release.git";
        rev = "21c3052c145720cde9c95814aa33f35e2caed93e";
        hash = "sha256-4ty09wIhIUq3vI2s5th/54iRL5jTzcYeDumtwzLqeVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_2d";
  version = "1.0.1-3";
  src = sources.tf2_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost rclcpp tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
