{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_common,
  clearpath_generator_gz,
  clearpath_viz,
  fetchgit,
  fetchurl,
  fetchzip,
  ign_ros2_control,
  ros_gz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    clearpath_gz = substituteSource {
      src = fetchgit {
        name = "clearpath_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "7e884313cb127b3f6661139da75d2d8a843b3195";
        hash = "sha256-pyNEzuU5nA/EgxKgsXhNYVoeUnkmsWOAI9yrm+6EgV4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_gz";
  version = "0.2.5-1";
  src = sources.clearpath_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_common clearpath_generator_gz clearpath_viz ign_ros2_control ros_gz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
