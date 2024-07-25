{
  ament_cmake,
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
    rtcm_msgs = substituteSource {
      src = fetchgit {
        name = "rtcm_msgs-source";
        url = "https://github.com/ros2-gbp/rtcm_msgs-release.git";
        rev = "69602dfc278b585614decf51343eec4b3d6f1c91";
        hash = "sha256-5yTtIdGostlOwChSlKKL4JivCyK284g0KYZxB6GBtBY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtcm_msgs";
  version = "1.1.6-3";
  src = sources.rtcm_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
