{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_urdf_utils,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    pal_hey5_description = substituteSource {
      src = fetchgit {
        name = "pal_hey5_description-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "aa3e9c44107466acf20d24fb126cbf8567238a38";
        hash = "sha256-PHPoLoHqKinZ/1lon1s8wnh8lfv9Hi+GTo/RrN077CU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_hey5_description";
  version = "4.1.0-1";
  src = sources.pal_hey5_description;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_urdf_utils xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
