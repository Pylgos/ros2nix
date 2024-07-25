{
  ament_cmake,
  buildRosPackage,
  clearpath_mounts_description,
  clearpath_platform_description,
  clearpath_sensors_description,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    clearpath_description = substituteSource {
      src = fetchgit {
        name = "clearpath_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "670cf4e7b57c6b704e2241a258fef59a35b080f2";
        hash = "sha256-9BnfdV0w3NdLXaSLcz8MR4Pf9NMikDEC5oKVGYY2FbY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_description";
  version = "0.2.9-1";
  src = sources.clearpath_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_mounts_description clearpath_platform_description clearpath_sensors_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
