{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_bridge,
  substituteSource,
}:
let
  sources = rec {
    ros_ign_bridge = substituteSource {
      src = fetchgit {
        name = "ros_ign_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "b9b7a7e193718bbccea5b7e93464d55c9a90be60";
        hash = "sha256-RdWmbvU5IgCZmP61YE5ks7tS6GPQaCmnvcvLeElEIg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_bridge";
  version = "0.254.1-1";
  src = sources.ros_ign_bridge;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
