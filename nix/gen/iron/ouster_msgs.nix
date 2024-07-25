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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ouster_msgs = substituteSource {
      src = fetchgit {
        name = "ouster_msgs-source";
        url = "https://github.com/ros2-gbp/ouster-ros-release.git";
        rev = "5be7d4e4126827faf7574b0b3f4bab7c90a9880b";
        hash = "sha256-QXpEmsN5AQifkW5xoJhoeCfwc7hbO0aSUGf738PwI08=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouster_msgs";
  version = "0.10.4-1";
  src = sources.ouster_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
