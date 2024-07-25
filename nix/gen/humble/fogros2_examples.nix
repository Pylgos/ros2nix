{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fogros2,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    fogros2_examples = substituteSource {
      src = fetchgit {
        name = "fogros2_examples-source";
        url = "https://github.com/ros2-gbp/fogros2-release.git";
        rev = "a1afb6b4adc434fc77a89b93e8fc98aac6c9a54b";
        hash = "sha256-Q88Rh23VRS6EUyEY8/Bjj9Ov9QZTCl3Hd5zEGY1uIUk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fogros2_examples";
  version = "0.1.7-1";
  src = sources.fogros2_examples;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fogros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
