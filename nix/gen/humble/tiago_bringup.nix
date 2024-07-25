{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  joy_linux,
  joy_teleop,
  launch_pal,
  play_motion2,
  substituteSource,
  teleop_tools_msgs,
  tiago_controller_configuration,
  tiago_description,
  twist_mux,
  twist_mux_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    tiago_bringup = substituteSource {
      src = fetchgit {
        name = "tiago_bringup-source";
        url = "https://github.com/pal-gbp/tiago_robot-release.git";
        rev = "f3face03b23212110efcd31dee3ded4f80ee6775";
        hash = "sha256-1o/KOQSYYBsaBA2669oDMujLGbuV2NBv9OtpNY6Yiww=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tiago_bringup";
  version = "4.2.16-1";
  src = sources.tiago_bringup;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs joy_linux joy_teleop launch_pal play_motion2 teleop_tools_msgs tiago_controller_configuration tiago_description twist_mux twist_mux_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
