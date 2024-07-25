{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_common,
  moveit_core,
  std_msgs,
  stomp,
  substituteSource,
  tf2_eigen,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_stomp = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "983c7b75ede89d2eb6ce110bdf0cb904f1679e75";
        hash = "sha256-2375+w6ZAJ+xxRX12rBEtm3mHwBXlpga/dW6e1xNfCQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_stomp";
  version = "2.8.0-1";
  src = sources.moveit_planners_stomp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library moveit_common moveit_core std_msgs stomp tf2_eigen visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
