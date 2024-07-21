{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle_msgs,
  osrf_pycommon,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    launch_ros = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "614dac856387c97632678b01252b0de112f1a346";
        hash = "sha256-cV925fWAMrUPzECwVRsuI+lqITsE2hoUUK+5X0gGpik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_ros";
  version = "0.26.5-2";
  src = sources.launch_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ composition_interfaces lifecycle_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}