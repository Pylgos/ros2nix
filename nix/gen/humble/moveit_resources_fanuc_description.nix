{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    moveit_resources_fanuc_description = substituteSource {
      src = fetchgit {
        name = "moveit_resources_fanuc_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "33324bf21d6e088aa17f1d11c25c6a3caf277e78";
        hash = "sha256-P7Jvlyy3AnzAMXC5Td5FPX23LUCcaw+L/UzmMUeJB3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_fanuc_description";
  version = "2.0.7-1";
  src = sources.moveit_resources_fanuc_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
