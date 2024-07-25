{
  ament_cmake,
  buildRosPackage,
  cartographer_ros,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    turtlebot3_cartographer = substituteSource {
      src = fetchgit {
        name = "turtlebot3_cartographer-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "05874a7c909d1bb325009d2e9c2a4ab4fd4de55c";
        hash = "sha256-PofMNoCLZpgvcxyB7i4wWaFlRC4VMzsOMK+L97MmVVU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_cartographer";
  version = "2.1.5-1";
  src = sources.turtlebot3_cartographer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cartographer_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
