{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nlohmann_json,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rmf_api_msgs = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "3ddec2ac8a893dce907b6f0ce5c14f2884b151c6";
        hash = "sha256-WWXtb6RS3PnoZg5WwD2Wx9/iv7vpEM7xbf0R3KYKIAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_api_msgs";
  version = "0.0.3-1";
  src = sources.rmf_api_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json python3Packages.jsonschema ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
