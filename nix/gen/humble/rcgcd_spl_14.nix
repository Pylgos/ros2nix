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
  substituteSource,
}:
let
  sources = rec {
    rcgcd_spl_14 = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "ef475377629e95f42e6d34845aeb93b1655981a7";
        hash = "sha256-JQXvh6wpQ69DhHYhz196j73AGfTuMgEEEo1pV3G0iIY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14";
  version = "2.1.0-1";
  src = sources.rcgcd_spl_14;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
