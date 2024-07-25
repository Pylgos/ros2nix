{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_ignition_bringup,
  irobot_create_ignition_plugins,
  irobot_create_ignition_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_ignition_sim = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "2c60dc17da1dac2d7941778ac31c17db1688f4c2";
        hash = "sha256-YtE9gS9ohYPn+ww+RBzpEvXn5Rf0ldxtPO69SfiE960=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_ignition_sim";
  version = "2.1.0-1";
  src = sources.irobot_create_ignition_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_ignition_bringup irobot_create_ignition_plugins irobot_create_ignition_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
