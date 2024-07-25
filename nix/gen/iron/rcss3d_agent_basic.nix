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
        rev = "a4a1ee760ff3f05d0e608e33a05c63b379d1160e";
        hash = "sha256-nDJGmIM8WHHjNPs3KRLNXOf8EM2VIwF9YZX1CVE662Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcss3d_agent_basic";
  version = "0.4.1-3";
  src = sources.rcss3d_agent_basic;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp_components rcss3d_agent ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
