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
  mola_kernel,
  mrpt2,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_launcher = substituteSource {
      src = fetchgit {
        name = "mola_launcher-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "260c1c2e505c889e2365c289d3d9d3a80475e07c";
        hash = "sha256-GRf9Vra3VSYFhMsHnyFlcmVi3UAXy4bTVe/ngnvUQ4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_launcher";
  version = "1.0.6-1";
  src = sources.mola_launcher;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
