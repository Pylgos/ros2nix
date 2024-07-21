{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
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
    rc_common_msgs = substituteSource {
      src = fetchgit {
        name = "rc_common_msgs-source";
        url = "https://github.com/ros2-gbp/rc_common_msgs_ros2-release.git";
        rev = "a1a39a8b05b4be20838bc8acec4af66a3f0d90dd";
        hash = "sha256-/ApqcAoxtUu0eHcF5gxxFhroOIdz457iCAONfAC2xxQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_common_msgs";
  version = "0.5.3-6";
  src = sources.rc_common_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
