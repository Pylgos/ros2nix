{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    pal_urdf_utils = substituteSource {
      src = fetchgit {
        name = "pal_urdf_utils-source";
        url = "https://github.com/pal-gbp/pal_urdf_utils-release.git";
        rev = "6d7baadad53f5f9cc7130315c6631098a74495d5";
        hash = "sha256-pP1Ddc8cafwTqUCei0wTUHIiOOw8KghYTAV+Xijvj9I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_urdf_utils";
  version = "2.0.1-1";
  src = sources.pal_urdf_utils;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
