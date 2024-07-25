{
  ament_copyright,
  ament_flake8,
  ament_pep257,
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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    turtle_tf2_py = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "fb9fb76fabcbdcb30fb56218fda68595bf3fbaec";
        hash = "sha256-KyrTt9hvh28k8MJ6EaD2AnuC3cH+nNMX5fYPjXkz6AA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtle_tf2_py";
  version = "0.3.6-4";
  src = sources.turtle_tf2_py;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs launch_ros python3Packages.numpy rclpy tf2_ros turtlesim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
