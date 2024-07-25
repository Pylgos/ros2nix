{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    depthai_descriptions = substituteSource {
      src = fetchgit {
        name = "depthai_descriptions-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "398130c7ee2df8a832851c237432d243675f5706";
        hash = "sha256-ooN5ph+NvjZNPth/KG60vspRYlYjlDoTTDtR0hDhp7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_descriptions";
  version = "2.9.0-1";
  src = sources.depthai_descriptions;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
