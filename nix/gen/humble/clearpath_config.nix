{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    clearpath_config = substituteSource {
      src = fetchgit {
        name = "clearpath_config-source";
        url = "https://github.com/clearpath-gbp/clearpath_config-release.git";
        rev = "29c960b0257f35ed202566fe034dae59f0217ad1";
        hash = "sha256-v+FzpQdj9EljUIti9ggrntX58HoWs3PcsDnbWoIj3/4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_config";
  version = "0.2.9-1";
  src = sources.clearpath_config;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
