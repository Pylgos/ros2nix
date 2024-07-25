{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    turtlebot3_description = substituteSource {
      src = fetchgit {
        name = "turtlebot3_description-source";
        url = "https://github.com/robotis-ros2-release/turtlebot3-release.git";
        rev = "f8575de53cd3d332b41f6e9bb854e3b1b6622999";
        hash = "sha256-YByZlr7CVSBBqtq25m1R6GLZEX1i+iFvVk+KlAyKAxU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_description";
  version = "2.1.5-1";
  src = sources.turtlebot3_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
