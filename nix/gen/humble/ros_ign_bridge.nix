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
        rev = "de917f667d6c37494c3e527f6eec48eb396fc2a5";
        hash = "sha256-KuUErQQbR5Ner7p4cNIx+a4b8HQlyDcLKWzNOR1cypo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_ign_bridge";
  version = "0.244.15-1";
  src = sources.ros_ign_bridge;
  nativeBuildInputs = [ ament_cmake ament_index_cpp ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
