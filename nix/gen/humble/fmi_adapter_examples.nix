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
        rev = "283b188b0d72435a2a745076791bf6e56274154b";
        hash = "sha256-R5kjXvGqUx+ux+q1zgh54sd5aNSXWSJ1edV01iOh5Fc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmi_adapter_examples";
  version = "2.1.1-1";
  src = sources.fmi_adapter_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmi_adapter launch_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
