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
    aruco_msgs = substituteSource {
      src = fetchgit {
        name = "aruco_msgs-source";
        url = "https://github.com/pal-gbp/aruco_ros-release.git";
        rev = "b08e374b49f3c348183226824bb4bd2161bab741";
        hash = "sha256-EUZsF13naoL/xNnzsHHJmDuodN/Bb15EI1Pc+ZV2bHk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_msgs";
  version = "5.0.5-1";
  src = sources.aruco_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}