{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  omni_base_gazebo,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    omni_base_simulation = substituteSource {
      src = fetchgit {
        name = "omni_base_simulation-source";
        url = "https://github.com/pal-gbp/omni_base_simulation-release.git";
        rev = "af8955bd12ae1b2043379f4152c1e9d5a1266bed";
        hash = "sha256-wEZSq0FUxIF08bsWXGXopWRLC9x39AWC9Y2igqR1Vf0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "omni_base_simulation";
  version = "2.0.3-1";
  src = sources.omni_base_simulation;
  nativeBuildInputs = [ ament_cmake_auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ omni_base_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
