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
        rev = "38b61d23496099e8481bb0c65045ee6864af404e";
        hash = "sha256-w72AADKlMFfhOngn3t7lc0wwaMSb6c31gfpeoiCDXg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_socketcan_msgs";
  version = "1.2.0-1";
  src = sources.ros2_socketcan_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
