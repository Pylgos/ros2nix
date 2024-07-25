{
  ament_cmake,
  ament_cmake_clang_format,
  andino_base,
  andino_description,
  buildRosPackage,
  controller_manager,
  diff_drive_controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  ros2controlcli,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    andino_control = substituteSource {
      src = fetchgit {
        name = "andino_control-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "9b72a28246f6944b9c6ba9eb3adee54886f17b75";
        hash = "sha256-Wttodq7wTRi//59LJCY7Vqlev0y0PrRZNLNGfPnYf5Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_control";
  version = "0.1.0-1";
  src = sources.andino_control;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ andino_base andino_description controller_manager diff_drive_controller joint_state_broadcaster ros2controlcli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
