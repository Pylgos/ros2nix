{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot_create_gazebo_bringup,
  irobot_create_gazebo_plugins,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    irobot_create_gazebo_sim = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_sim-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "bc45aad6a7d767cd72d2ee6a1ff0de4b0a3da4df";
        hash = "sha256-nCTh/fk+mSyfDnzh/DTdbZXuDuVXEJrrVm8wfrRepic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_gazebo_sim";
  version = "2.1.0-1";
  src = sources.irobot_create_gazebo_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ irobot_create_gazebo_bringup irobot_create_gazebo_plugins ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
