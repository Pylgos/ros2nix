{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_image,
  substituteSource,
}:
let
  sources = rec {
    ros_ign_image = substituteSource {
      src = fetchgit {
        name = "ros_ign_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "86897ab14987de6c33ffaa2898aa4da964475ee8";
        hash = "sha256-ao+tx7hNQmeUog0l9fGxoIGNgvdR1KDyec7ZujW5RfQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_image";
  version = "0.244.15-1";
  src = sources.ros_ign_image;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_image ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
