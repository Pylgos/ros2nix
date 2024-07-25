{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    game_controller_spl_interfaces = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "24ea8e5854c9cb298e688f2f57d798ba16dca193";
        hash = "sha256-k4T8q+H7e8ehhwXPJSPDi9wowsbRZwok/Q2XJm4TZP0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "game_controller_spl_interfaces";
  version = "2.1.0-1";
  src = sources.game_controller_spl_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
