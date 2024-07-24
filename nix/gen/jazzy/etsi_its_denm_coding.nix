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
    etsi_its_denm_coding = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "15355d04c4d092ff555a609f1c6aa8692662f18b";
        hash = "sha256-4nlbTzT0Ep6DZhRgf5dIz+hyZTHbrTQ10xwQ0Dg8gW4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_denm_coding";
  version = "2.0.2-1";
  src = sources.etsi_its_denm_coding;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
