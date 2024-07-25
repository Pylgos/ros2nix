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
    etsi_its_primitives_conversion = substituteSource {
      src = fetchgit {
        name = "etsi_its_primitives_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "686beb36eb1f477f02cf3339cb8a56f7cd0e94e9";
        hash = "sha256-gM1SxBTjxgp5LRbNUYinuNTAlnr0Rlw3UUMYzB0UFKs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_primitives_conversion";
  version = "2.0.2-1";
  src = sources.etsi_its_primitives_conversion;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
