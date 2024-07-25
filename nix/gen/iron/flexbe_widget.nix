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
        rev = "f7e6b8c19abd9f34af05e827ba13091377606a6d";
        hash = "sha256-HYuNTL6CNnsVTTDoAK0iONrGj/KEGLYKbc2oT+dGbrw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_widget";
  version = "3.0.2-1";
  src = sources.flexbe_widget;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_mirror flexbe_msgs flexbe_onboard launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
