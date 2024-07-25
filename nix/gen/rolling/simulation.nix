{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_base,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_interfaces,
  ros_gz_sim,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    simulation = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "0cd1c0427876f68c227a63f8e2051185965da6ac";
        hash = "sha256-F5Xdwf30yp+svq3b6jwcfeMbm+oLQKi9hw3ZkozBy68=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simulation";
  version = "0.11.0-1";
  src = sources.simulation;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_base ros_gz_bridge ros_gz_image ros_gz_interfaces ros_gz_sim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}