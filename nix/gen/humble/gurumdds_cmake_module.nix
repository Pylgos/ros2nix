{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    gurumdds_cmake_module = substituteSource {
      src = fetchgit {
        name = "gurumdds_cmake_module-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "256077c24c4aa72f0682f7b4c7139295d483d2e8";
        hash = "sha256-DRGxP9Z6o21OOUS+ec4eei4Km/B9jvXnR3e670/XB/Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gurumdds_cmake_module";
  version = "3.4.2-1";
  src = sources.gurumdds_cmake_module;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
