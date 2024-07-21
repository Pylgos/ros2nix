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
        rev = "301e7308560a163b20efe0d0d31436c18872c19e";
        hash = "sha256-6W/jg30bsrTBiV+5p6/AaFd29TgtIaowVp8xr3FIWB0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_launch";
  version = "1.9.1-3";
  src = sources.simple_launch;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_python ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
