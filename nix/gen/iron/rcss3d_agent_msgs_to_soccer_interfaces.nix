{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcss3d_agent_msgs,
  soccer_vision_3d_msgs,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent_msgs_to_soccer_interfaces = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_msgs_to_soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "fcdeb89764a14dfe9d2f219e6a550a2a9596bbf1";
        hash = "sha256-2bEjbfPy02UiTflYzF8AZb2bjZB/Xg1iHUC0deLs7UQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_msgs_to_soccer_interfaces";
  version = "0.4.1-3";
  src = sources.rcss3d_agent_msgs_to_soccer_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcss3d_agent_msgs soccer_vision_3d_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
