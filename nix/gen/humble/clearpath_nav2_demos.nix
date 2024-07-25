{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_config,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_bringup,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    clearpath_nav2_demos = substituteSource {
      src = fetchgit {
        name = "clearpath_nav2_demos-source";
        url = "https://github.com/clearpath-gbp/clearpath_nav2_demos-release.git";
        rev = "032e852d06dc1df0a323784c5445893f2cd443e0";
        hash = "sha256-MfQUVBOjapyiSvj9cXuScIhXjZ7cVKYlu3Bw8Lz63zg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_nav2_demos";
  version = "0.2.0-1";
  src = sources.clearpath_nav2_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_config nav2_bringup slam_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
