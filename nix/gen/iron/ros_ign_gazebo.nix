{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_sim,
  substituteSource,
}:
let
  sources = rec {
    ros_ign_gazebo = substituteSource {
      src = fetchgit {
        name = "ros_ign_gazebo-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "19fda23a76b77b3ed7622c9819be22acc270bea6";
        hash = "sha256-hFeWfCHHcJeSXhk53LHztGdhMrqa3YMSjlh1vjvWWZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_gazebo";
  version = "0.254.1-1";
  src = sources.ros_ign_gazebo;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_sim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
