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
    rcgcd_spl_14 = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "2dab93b4f4ed2f90d5005579a16c889a054e5266";
        hash = "sha256-VULdmL4Pu/IZU1X1JkULk6bbLT7IatLlGM0eorelYso=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14";
  version = "3.1.0-1";
  src = sources.rcgcd_spl_14;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
