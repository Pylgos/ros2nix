{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  raspimouse_fake,
  raspimouse_gazebo,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    raspimouse_sim = substituteSource {
      src = fetchgit {
        name = "raspimouse_sim-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "2b980147322d5e53b802b910086269c7da11ff6b";
        hash = "sha256-hK0nZbUe46oIIljVmBoapgmABRQJN+KIr6FQdusBy1E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_sim";
  version = "2.1.0-1";
  src = sources.raspimouse_sim;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ raspimouse_fake raspimouse_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
