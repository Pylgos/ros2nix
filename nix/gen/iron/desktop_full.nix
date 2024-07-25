{
  ament_cmake,
  buildRosPackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  perception,
  ros_ign_gazebo_demos,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    desktop_full = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "c7a1427e4f1adc21444ab607cd09a6487b2f379b";
        hash = "sha256-Fpf8KQVw8ZcNqmf/8VyrlxunQpvxC9fZZHZVUBkM4IU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop_full";
  version = "0.10.0-3";
  src = sources.desktop_full;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ desktop perception ros_ign_gazebo_demos simulation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
