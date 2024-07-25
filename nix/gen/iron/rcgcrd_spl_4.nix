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
    rcgcrd_spl_4 = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "eb50c7157d527034454d14efa7d914cc586096c9";
        hash = "sha256-S867r8GfDsuXY5RNWhmAPZMtS54vAGuVs1CDoKvFVHg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4";
  version = "3.1.0-1";
  src = sources.rcgcrd_spl_4;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
