{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    play_motion2_msgs = substituteSource {
      src = fetchgit {
        name = "play_motion2_msgs-source";
        url = "https://github.com/pal-gbp/play_motion2-release.git";
        rev = "fe26b7f7b9c4506a2f9a16ac1d9d0819b6ff409d";
        hash = "sha256-KQDJLTP3aTmVV6x7FZ6mv7bHEeNswFt4TUG+xPpWX4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "play_motion2_msgs";
  version = "1.1.2-1";
  src = sources.play_motion2_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
