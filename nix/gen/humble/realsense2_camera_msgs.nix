{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    realsense2_camera_msgs = substituteSource {
      src = fetchgit {
        name = "realsense2_camera_msgs-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "038ea5121a147bb4b5fec11246dbe40fbc674c21";
        hash = "sha256-uL0BZSHsWOr4JF0PxcIJa6XvMAWzM+MVRW7SacxABH4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "realsense2_camera_msgs";
  version = "4.55.1-1";
  src = sources.realsense2_camera_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
