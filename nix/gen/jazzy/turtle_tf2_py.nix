{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  python3Packages,
  rclpy,
  substituteSource,
  tf2_ros,
  turtlesim,
}:
let
  sources = rec {
    turtle_tf2_py = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "d231c2cfdb3f630b4d833e8a6dcef28ed9a5d900";
        hash = "sha256-KyrTt9hvh28k8MJ6EaD2AnuC3cH+nNMX5fYPjXkz6AA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_tf2_py";
  version = "0.3.6-5";
  src = sources.turtle_tf2_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros rclpy tf2_ros turtlesim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
