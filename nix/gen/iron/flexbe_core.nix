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
        rev = "a4983d1fd4f9c5ae4c2173c33bbbd6f9c1666df7";
        hash = "sha256-x6dqbhbuHbIB3Q4t/e2JNDNkHd52KcHEB7oIgD7jl5g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_core";
  version = "3.0.2-1";
  src = sources.flexbe_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_msgs rclpy std_msgs std_srvs tf2_ros_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
