{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmi_adapter,
  launch,
  launch_ros,
  substituteSource,
}:
let
  sources = rec {
    fmi_adapter_examples = substituteSource {
      src = fetchgit {
        name = "fmi_adapter_examples-source";
        url = "https://github.com/ros2-gbp/fmi_adapter-release.git";
        rev = "c67d5f45f18845c635612dc23cc487c1cff21292";
        hash = "sha256-FNLnKvCy1QMsMlkdwfiwnupdtP9U06oTSPaQTkp7XOA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter_examples";
  version = "2.1.2-2";
  src = sources.fmi_adapter_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmi_adapter launch_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
