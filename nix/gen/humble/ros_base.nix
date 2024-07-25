{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry2,
  kdl_parser,
  robot_state_publisher,
  ros_core,
  rosbag2,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    ros_base = substituteSource {
      src = fetchgit {
        name = "ros_base-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "0017343a06fad0444e4792cfa54d4e89d4d49ecb";
        hash = "sha256-qTPrFPcFntKAifYcXqjryFyhWK0SgTD9g57SPOb7S9U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_base";
  version = "0.10.0-1";
  src = sources.ros_base;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry2 kdl_parser robot_state_publisher ros_core rosbag2 urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
