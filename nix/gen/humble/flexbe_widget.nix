{
  ament_cmake,
  ament_cmake_python,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_mirror,
  flexbe_msgs,
  flexbe_onboard,
  launch_ros,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_widget = substituteSource {
      src = fetchgit {
        name = "flexbe_widget-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "3669168e6e5b012d9e0c3e2fb558cd9e7a67494b";
        hash = "sha256-7o8QRN5UOrStvm1a801//VUjMktrrQZY/jib8wD4gws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_widget";
  version = "2.3.5-1";
  src = sources.flexbe_widget;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_mirror flexbe_msgs flexbe_onboard launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
