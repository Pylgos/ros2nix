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
        rev = "9ad683b0109b6833f921e792a82abc28e0f5ff78";
        hash = "sha256-7fPDB0YYvbAyn6FR8ehUkQObPIy/9r2yuFMW2dXjA/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gurumdds_cmake_module";
  version = "5.0.0-1";
  src = sources.gurumdds_cmake_module;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
