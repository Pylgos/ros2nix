{
  ament_cmake_python,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
  vimbax_camera_msgs,
}:
let
  sources = rec {
    vimbax_camera_events = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_events-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "27adda723eb3820a79cb1498883201a70e0fc467";
        hash = "sha256-7tNbPysPYo68rQieGzajc+puGLCzoeLVQdINmksdnHU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vimbax_camera_events";
  version = "1.0.2-1";
  src = sources.vimbax_camera_events;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ vimbax_camera_msgs ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
