{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  tf2_py,
}:
let
  sources = rec {
    tf2_ros_py = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "1d2965952c75d972b84287db90a6694696c2af89";
        hash = "sha256-eEs2Ktsax2+sgUkgVfETQBGFuT1AWGQCsbiYntf67CM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_ros_py";
  version = "0.25.7-1";
  src = sources.tf2_ros_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy sensor_msgs std_msgs tf2_msgs tf2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
