{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ibeo_msgs = substituteSource {
      src = fetchgit {
        name = "ibeo_msgs-source";
        url = "https://github.com/ros2-gbp/astuff_sensor_msgs-release.git";
        rev = "81259d1f456e7bfa6f1d31a60bf2f7126ba8982e";
        hash = "sha256-RLaDU8WKC534uEb0HZcS/iP0//JhyyaFVG8osixglEY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ibeo_msgs";
  version = "4.0.0-1";
  src = sources.ibeo_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
