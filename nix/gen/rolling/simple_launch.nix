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
        rev = "f48f8e0af3e7f45795f209cbc2b8d403f950c9fe";
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