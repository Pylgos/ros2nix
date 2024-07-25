{
  ament_cmake,
  ament_cmake_gtest,
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
    vision_msgs = substituteSource {
      src = fetchgit {
        name = "vision_msgs-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "55835f495b556e3ca6c7175971c21ce62dd7e342";
        hash = "sha256-3eI3eKu1pjYzfsXNxO7zGJoJNG6s9QU4SjIzqZvSNEI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vision_msgs";
  version = "4.1.1-1";
  src = sources.vision_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
