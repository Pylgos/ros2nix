{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  rosbag2_py,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_examples_py = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7d64b270913cdf78be1c361f8cbcf2249a13c4dc";
        hash = "sha256-VYsXNeA83yxwaRz2B0qG3yfn4fYviLthQbzHvtu/0W0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_examples_py";
  version = "0.22.6-1";
  src = sources.rosbag2_examples_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces rclpy rosbag2_py std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
