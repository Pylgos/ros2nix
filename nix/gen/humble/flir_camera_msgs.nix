{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    flir_camera_msgs = substituteSource {
      src = fetchgit {
        name = "flir_camera_msgs-source";
        url = "https://github.com/ros-drivers-gbp/flir_camera_driver-release.git";
        rev = "89325a885063ecd4d1c05af39c0ba78d104a9a6e";
        hash = "sha256-sgw9t2MWtntbiI7rR41/JghrPEfutoDDgPOM6G9sS28=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flir_camera_msgs";
  version = "2.1.17-1";
  src = sources.flir_camera_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
