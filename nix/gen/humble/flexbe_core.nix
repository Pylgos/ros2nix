{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_msgs,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    flexbe_core = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "c48851e9148661b8345787a60d3943e9fe81ca05";
        hash = "sha256-5j7ZVKLmKgyIPUiwHQUYBuoJgricZqE+6TcyVXuWosg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_core";
  version = "2.3.5-1";
  src = sources.flexbe_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_msgs rclpy std_msgs std_srvs tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
