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
    gc_spl_interfaces = substituteSource {
      src = fetchgit {
        name = "gc_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "8ec7d3862cc0381cd09c06b0c8a7b33be38acfa8";
        hash = "sha256-exKrtiXHtnB1nbwpX9fEAaDN4VYF9Y52iBXzWf8epoE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_interfaces";
  version = "2.1.0-1";
  src = sources.gc_spl_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
