{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    splsm_8 = substituteSource {
      src = fetchgit {
        name = "splsm_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "fee7b4cd6ab28fed5b71bb4a46ad8420bcff534f";
        hash = "sha256-NQtHPGs/nlAs266SyTZ4ICD0IPF8OWObP/zDL+H7olc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_8";
  version = "2.1.0-1";
  src = sources.splsm_8;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
