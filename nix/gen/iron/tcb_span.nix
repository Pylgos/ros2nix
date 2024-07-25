{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tcb_span = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "16229d5cfa0efc43301ace357361e5d57cccce54";
        hash = "sha256-61JrUYgWw+LJJmryzDfZte0H+hhzDbHqOY1wEyk996Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tcb_span";
  version = "1.0.2-4";
  src = sources.tcb_span;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
