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
    r2r_spl_test_interfaces = substituteSource {
      src = fetchgit {
        name = "r2r_spl_test_interfaces-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "72d177cde182a940e4b31715c410befb28716085";
        hash = "sha256-Qxrk7JWwiwAko7EpogOMMuq5Ur8ZYA1ziIuII5y8PWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_test_interfaces";
  version = "2.1.0-1";
  src = sources.r2r_spl_test_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
