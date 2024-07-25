{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphviz,
  python3Packages,
  rclpy,
  substituteSource,
  tf2_msgs,
  tf2_py,
  tf2_ros_py,
}:
let
  sources = rec {
    tf2_tools = substituteSource {
      src = fetchgit {
        name = "tf2_tools-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "542f35839edbdaa3a449c51601ec6f6d2aa146a7";
        hash = "sha256-O9MPSw6kIKxfkmtlXz4c3DFhxkGbGroCh3hPpyQl7o0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_tools";
  version = "0.38.0-1";
  src = sources.tf2_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphviz rclpy tf2_msgs tf2_py tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
