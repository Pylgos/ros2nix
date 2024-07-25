{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  ros_gz_sim_demos,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "723c6dea28d8cfa5143e1f7dba28fa1c5d61dc92";
        hash = "sha256-AFoufMeOaCc+87OVV+8aQqyE05CV0yWLMh1eIr3yfO4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz";
  version = "0.244.15-1";
  src = sources.ros_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ros_gz_image ros_gz_sim ros_gz_sim_demos ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
