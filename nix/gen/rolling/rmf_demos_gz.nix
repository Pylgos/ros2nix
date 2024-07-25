{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_sim_vendor,
  launch_xml,
  rmf_building_sim_gz_plugins,
  rmf_demos,
  rmf_robot_sim_gz_plugins,
  ros2launch,
  ros_gz_bridge,
  substituteSource,
  teleop_twist_keyboard,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rmf_demos_gz = substituteSource {
      src = fetchgit {
        name = "rmf_demos_gz-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "29c18cb399ba028da1a30cbca69082981b52a770";
        hash = "sha256-t3SCEaDdsSY779uKQlTe7KpS+QNfowrHfD3Yrn46cd8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_gz";
  version = "2.4.0-1";
  src = sources.rmf_demos_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_sim_vendor rmf_building_sim_gz_plugins rmf_demos rmf_robot_sim_gz_plugins ros2launch ros_gz_bridge teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
