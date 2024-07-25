{
  ament_cmake,
  buildRosPackage,
  diagnostic_aggregator,
  diagnostic_common_diagnostics,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  self_test,
  substituteSource,
}:
let
  sources = rec {
    diagnostics = substituteSource {
      src = fetchgit {
        name = "diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "dfb27aa7cd725434cb16083e87ec4212778b7dd1";
        hash = "sha256-MdOGwh6obLLj6T4XHT7SZXym8Lu8vvZAkPNhp+T3UIM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostics";
  version = "4.0.0-1";
  src = sources.diagnostics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_common_diagnostics diagnostic_updater self_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
