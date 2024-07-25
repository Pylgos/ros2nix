{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  omni_base_bringup,
  omni_base_controller_configuration,
  omni_base_description,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_robot = substituteSource {
      src = fetchgit {
        name = "omni_base_robot-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "6ce535d25ce6c60584157efaed8787e3a96b08e4";
        hash = "sha256-FByhl+h1vLV4frVvUIKcYdee9lnASKmP5yN7mcOKYRc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_robot";
  version = "2.0.18-1";
  src = sources.omni_base_robot;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ omni_base_bringup omni_base_controller_configuration omni_base_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
