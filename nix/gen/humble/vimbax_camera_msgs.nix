{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    vimbax_camera_msgs = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_msgs-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "a9cc716745e89ec6d103a6f146a1b4145f7d5d29";
        hash = "sha256-3JNWRjKihj2jf7JtNIeF29yP1L7UJ3Z8EG6kDpN2zpg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vimbax_camera_msgs";
  version = "1.0.2-1";
  src = sources.vimbax_camera_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
