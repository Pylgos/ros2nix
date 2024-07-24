{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_metric_maps = substituteSource {
      src = fetchgit {
        name = "mola_metric_maps-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "5f67ddd96f7ade96f98654e67980370c34771367";
        hash = "sha256-/OhIDf+0rU/PhnVWE03vDT/Dne4y/rw0H1fREl6WL6s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_metric_maps";
  version = "1.0.6-1";
  src = sources.mola_metric_maps;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
