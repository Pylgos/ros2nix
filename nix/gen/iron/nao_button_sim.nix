{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_sensor_msgs,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    nao_button_sim = substituteSource {
      src = fetchgit {
        name = "nao_button_sim-source";
        url = "https://github.com/ros2-gbp/nao_button_sim-release.git";
        rev = "462f141404ab8f1cbcb8b319d20d70be6667d0f0";
        hash = "sha256-/gMyJIdrmcbTKDo/EfoqgOX7KarnmV74PSf3Z+ny/bc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_button_sim";
  version = "0.2.0-1";
  src = sources.nao_button_sim;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
