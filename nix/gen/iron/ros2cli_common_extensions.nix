{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  launch_yaml,
  ros2action,
  ros2cli,
  ros2component,
  ros2doctor,
  ros2interface,
  ros2launch,
  ros2lifecycle,
  ros2multicast,
  ros2node,
  ros2param,
  ros2pkg,
  ros2run,
  ros2service,
  ros2topic,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    ros2cli_common_extensions = substituteSource {
      src = fetchgit {
        name = "ros2cli_common_extensions-source";
        url = "https://github.com/ros2-gbp/ros2cli_common_extensions-release.git";
        rev = "0002428eb821bf26e969cfff7693c0ac9ccaef4e";
        hash = "sha256-z8FDxLwLVsWrizQJOq3z9YOrVfKMUFY04UlEwiFEmrY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli_common_extensions";
  version = "0.2.2-3";
  src = sources.ros2cli_common_extensions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml launch_yaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2action ros2cli ros2component ros2doctor ros2interface ros2launch ros2lifecycle ros2multicast ros2node ros2param ros2pkg ros2run ros2service ros2topic sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
