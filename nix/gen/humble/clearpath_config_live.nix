{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_generator_common,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    clearpath_config_live = substituteSource {
      src = fetchgit {
        name = "clearpath_config_live-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "b8567e5a83e2da6d32cbacd860a1d2020b343689";
        hash = "sha256-ZscRdU08pMQBn92zXp33tsFWCbZIccAVA4Tm9j8aTJU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_config_live";
  version = "0.1.2-1";
  src = sources.clearpath_config_live;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_generator_common python3Packages.watchdog rclpy xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
