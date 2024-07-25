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
        rev = "b7c3affa3ed8f893529b33254fcc9ff1fbef7c60";
        hash = "sha256-Qb7d5afDoCT82MSCVCcmg1hBrtYesdUzZ6yAA9UR9qw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_tools";
  version = "0.31.7-1";
  src = sources.tf2_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ graphviz rclpy tf2_msgs tf2_py tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
