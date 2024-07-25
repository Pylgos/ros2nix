{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marvelmind_ros2_msgs = substituteSource {
      src = fetchgit {
        name = "marvelmind_ros2_msgs-source";
        url = "https://github.com/MarvelmindRobotics/marvelmind_ros2_msgs_release.git";
        rev = "e2cf711f412e715d454cc7f4c7d26966f4408d8b";
        hash = "sha256-Ge2JCHAh80HBI0fCpNFjg9fJhcotvDi2auvD+pPFzig=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marvelmind_ros2_msgs";
  version = "1.0.2-1";
  src = sources.marvelmind_ros2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
