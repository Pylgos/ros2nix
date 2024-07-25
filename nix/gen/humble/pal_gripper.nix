{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_gripper_controller_configuration,
  pal_gripper_description,
  substituteSource,
}:
let
  sources = rec {
    pal_gripper = substituteSource {
      src = fetchgit {
        name = "pal_gripper-source";
        url = "https://github.com/pal-gbp/pal_gripper-release.git";
        rev = "c0fde76cfe8ebafc1accfd183098ce503778d7a5";
        hash = "sha256-Ep8aD9bujxF/FPXBgTyAzjk6AEBFKHohL4oDAwnKjEg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_gripper";
  version = "3.2.0-1";
  src = sources.pal_gripper;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_gripper_controller_configuration pal_gripper_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
