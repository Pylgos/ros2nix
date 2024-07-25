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
        rev = "de3b3ce00084ad6eb0203cbfcdd07645aa0329a2";
        hash = "sha256-qTPrFPcFntKAifYcXqjryFyhWK0SgTD9g57SPOb7S9U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_base";
  version = "0.10.0-3";
  src = sources.ros_base;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry2 kdl_parser robot_state_publisher ros_core rosbag2 urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
