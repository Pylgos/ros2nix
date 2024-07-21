{
  ament_cmake,
  buildRosPackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  perception,
  ros_gz_sim_demos,
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
        rev = "3bdd312d71e66a970a9491a2beb2e6ee4a82e417";
        hash = "sha256-Ym/P4L92jCLQbe2hhq+3I5CLtJE59ya1csIFnutZlBE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "desktop_full";
  version = "0.11.0-1";
  src = sources.desktop_full;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ desktop perception ros_gz_sim_demos simulation ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
