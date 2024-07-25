{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    simple_term_menu_vendor = substituteSource {
      src = fetchgit {
        name = "simple_term_menu_vendor-source";
        url = "https://github.com/clearpath-gbp/simple_term_menu_vendor-release.git";
        rev = "6d081d38e3a3dbecab23bfada30ef8135cdef18f";
        hash = "sha256-toTrUyUqy7ijNOnTyHXXDtn+mvXcO8izZRsbIFv9Szw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simple_term_menu_vendor";
  version = "1.5.7-1";
  src = sources.simple_term_menu_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
