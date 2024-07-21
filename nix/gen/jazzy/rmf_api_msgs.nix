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
        rev = "4418fc3b6cdc5ba308fae642fe43f33cf4953585";
        hash = "sha256-Ak1dhux0ba8ujWuk1C3DYnT66cMNOm8TpfQXwo3I/BQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_api_msgs";
  version = "0.3.1-1";
  src = sources.rmf_api_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json python3Packages.jsonschema ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}