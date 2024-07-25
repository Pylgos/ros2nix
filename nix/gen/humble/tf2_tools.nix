{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  graphviz,
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
        rev = "89d2d73496b7001d410d5df988643efd23ca22ee";
        hash = "sha256-M2H5Oi2adUeZTqF0xXSwq8v/KSp3F2lqQd+Sfkc3aSg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_tools";
  version = "0.25.7-1";
  src = sources.tf2_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphviz rclpy tf2_msgs tf2_py tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
