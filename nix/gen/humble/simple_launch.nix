{
  ament_cmake_python,
  ament_index_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    simple_launch = substituteSource {
      src = fetchgit {
        name = "simple_launch-source";
        url = "https://github.com/ros2-gbp/simple_launch-release.git";
        rev = "3ca237090db1f8c519fe2ea838fd9c6d7803bcf7";
        hash = "sha256-qGRcyWgJ5d0NzsUAXpLLeRHBywF3IPhCiLyA5ZOLBqs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_launch";
  version = "1.10.1-1";
  src = sources.simple_launch;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
