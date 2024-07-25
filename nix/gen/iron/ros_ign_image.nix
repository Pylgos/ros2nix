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
        rev = "4e16eaa4cd8845552fc8b26d34e2378e0feb87f0";
        hash = "sha256-x92Jx/Uh5qjnuZO4zYrTIhdQeFtBIA6RzmqoPzrE31k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_image";
  version = "0.254.1-1";
  src = sources.ros_ign_image;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_image ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
