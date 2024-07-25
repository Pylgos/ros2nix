{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_cam_coding = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "9ed091d4495f0239dc8c42718ae8e88ddd009108";
        hash = "sha256-o/O0488lozKnGTOebwvYgVCrbLZGaIdNUceJd0G1+NU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_cam_coding";
  version = "2.0.2-1";
  src = sources.etsi_its_cam_coding;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
