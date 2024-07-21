{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_common_diagnostics = substituteSource {
      src = fetchgit {
        name = "diagnostic_common_diagnostics-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "b269bcc4b678b37724dbaf370d138dc16fd5b620";
        hash = "sha256-EQsw/5GFDB9IqZNAIaVW4uETZLPQT88AlT4uqy4WPcc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_common_diagnostics";
  version = "3.1.2-3";
  src = sources.diagnostic_common_diagnostics;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
