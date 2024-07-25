{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros,
  moveit_setup_assistant,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d16b4ec865af597c1ad6cf3ebcb2a8be0feb0de4";
        hash = "sha256-ks+3x/OmI9wu9+rUiTQQo2PYVKkbS5A0U5xsNN9LqhA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit";
  version = "2.10.0-1";
  src = sources.moveit;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros moveit_setup_assistant ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}