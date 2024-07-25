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
        rev = "919c9fd2ec8dedd4aa54e1a5ee36a7cfcb9b68ac";
        hash = "sha256-IF8OEtvxpnxPeUKCz9gmc17MMcYax9RHIn8Hj3mIgb4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_api_msgs";
  version = "0.1.1-1";
  src = sources.rmf_api_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json python3Packages.jsonschema ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
