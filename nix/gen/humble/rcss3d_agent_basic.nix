{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_components,
  rcss3d_agent,
  substituteSource,
}:
let
  sources = rec {
    rcss3d_agent_basic = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_basic-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "df3a49eaa4435ee85b9bbf3c728e52e35b0f81bd";
        hash = "sha256-/y2Ix6BrJgLPK+QOIDsvnk4yzsToQyQxNELOVAOomAQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_basic";
  version = "0.2.2-1";
  src = sources.rcss3d_agent_basic;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp_components rcss3d_agent ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
