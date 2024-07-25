{
  ament_cmake,
  buildRosPackage,
  etsi_its_denm_coding,
  etsi_its_denm_msgs,
  etsi_its_primitives_conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_denm_conversion = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0f39c09ea9de0eee5458acf68ec9ca5cdc7e5e6c";
        hash = "sha256-3D4Ptry5jbxai/lE0Jt5cIZQ1Yhvnsf6l6clJHCJMa0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_denm_conversion";
  version = "2.0.2-1";
  src = sources.etsi_its_denm_conversion;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_denm_coding etsi_its_denm_msgs etsi_its_primitives_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
