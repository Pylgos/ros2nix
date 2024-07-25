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
        rev = "da64fce1f703ece36e24149d7d5d463367209ab8";
        hash = "sha256-oXZqHryoU1h3aZd3Br5M/IlFt8tcKoH5uPNhCT//nY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_gazebo";
  version = "0.244.15-1";
  src = sources.ros_ign_gazebo;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_sim ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
