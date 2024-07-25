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
        rev = "e12c98a46b7a0c315319412140f11668c730286a";
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
