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
        rev = "bb781272c177c0c8ba52a463b92b22b5967fe6de";
        hash = "sha256-7CZuIOrlykiGZjasGUteGXpD0cEPrybrbJvmdKJFWp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostics";
  version = "4.3.0-1";
  src = sources.diagnostics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_common_diagnostics diagnostic_updater self_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
