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
        rev = "a47f052fb2393dcc217944068975064b2ab3020c";
        hash = "sha256-Fpf8KQVw8ZcNqmf/8VyrlxunQpvxC9fZZHZVUBkM4IU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop_full";
  version = "0.10.0-1";
  src = sources.desktop_full;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ desktop perception ros_ign_gazebo_demos simulation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
