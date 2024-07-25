{
  ament_cmake_auto,
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
    ros2_socketcan_msgs = substituteSource {
      src = fetchgit {
        name = "ros2_socketcan_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_socketcan-release.git";
        rev = "b5f53424d5b3fc3543dac4edbc34e1e14c152f49";
        hash = "sha256-w72AADKlMFfhOngn3t7lc0wwaMSb6c31gfpeoiCDXg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan_msgs";
  version = "1.2.0-2";
  src = sources.ros2_socketcan_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
