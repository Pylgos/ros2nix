{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo_bringup,
  leo_fw,
  substituteSource,
}:
let
  sources = rec {
    leo_robot = substituteSource {
      src = fetchgit {
        name = "leo_robot-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "4e556800413f0ff3c89dd3f2c71f10d4d9544865";
        hash = "sha256-0LFVi2DALRU231BQNWmUX5ZbnWkeGbjwQ7+D8HUZ5Rw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_robot";
  version = "1.4.0-1";
  src = sources.leo_robot;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo leo_bringup leo_fw ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
