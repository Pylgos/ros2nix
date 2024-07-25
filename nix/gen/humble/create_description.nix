{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  robot_state_publisher,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    create_description = substituteSource {
      src = fetchgit {
        name = "create_description-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "c374c4ab4eaa51a327a206c8022572eb80afe77b";
        hash = "sha256-G8MqHWNRsOxe5Owcp+iehoSW/IVZU1RDYojjaoDm0ZU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create_description";
  version = "3.1.0-1";
  src = sources.create_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
