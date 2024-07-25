{
  ament_cmake,
  buildRosPackage,
  create_bringup,
  create_description,
  create_driver,
  create_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    create_robot = substituteSource {
      src = fetchgit {
        name = "create_robot-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "80b307df7ec7b775fea09917a06e1a2b313b3154";
        hash = "sha256-we7mLpPQSBnPqtlCN0oYlFUD1AFzkw8PHAV7sBCYoF8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create_robot";
  version = "3.1.0-1";
  src = sources.create_robot;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ create_bringup create_description create_driver create_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
