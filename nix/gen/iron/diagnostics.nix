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
        rev = "106272c873b997be4a02ac1fa6ec37a025f240e0";
        hash = "sha256-HJVQRzjf7RLdBx3R/HYGMe5fVQAD9X7WtpuVXk4Li3g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostics";
  version = "4.1.0-1";
  src = sources.diagnostics;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_aggregator diagnostic_common_diagnostics diagnostic_updater self_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
