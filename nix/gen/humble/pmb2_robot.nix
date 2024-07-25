{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pmb2_bringup,
  pmb2_controller_configuration,
  pmb2_description,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pmb2_robot = substituteSource {
      src = fetchgit {
        name = "pmb2_robot-source";
        url = "https://github.com/pal-gbp/pmb2_robot-gbp.git";
        rev = "12c0f7541d25618bc84b50e1f41745429cc5ebc8";
        hash = "sha256-p9jwZDs9mpd9+nnm0GulYwbpiXOUiB6ivz68qMrcgQ4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pmb2_robot";
  version = "5.0.25-1";
  src = sources.pmb2_robot;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pmb2_bringup pmb2_controller_configuration pmb2_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
