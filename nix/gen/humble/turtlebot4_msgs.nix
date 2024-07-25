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
    turtlebot4_msgs = substituteSource {
      src = fetchgit {
        name = "turtlebot4_msgs-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "ee3d93df10b42b1ffe0e14b36a91b33120a12195";
        hash = "sha256-Y5yPAwQhineKSpwufYHXJAECt/MNKqve7LgDrg9kqOU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot4_msgs";
  version = "1.0.5-1";
  src = sources.turtlebot4_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
