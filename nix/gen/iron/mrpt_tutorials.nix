{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mvsim,
  substituteSource,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    mrpt_tutorials = substituteSource {
      src = fetchgit {
        name = "mrpt_tutorials-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "615891a9be03746cf1f57fbd3c9a1a88556eb1a4";
        hash = "sha256-op5QzXtPzS28BARwqqbL52mJ1Bj8GCZqBjdWatFgvNY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_tutorials";
  version = "2.0.0-1";
  src = sources.mrpt_tutorials;
  nativeBuildInputs = [ ament_cmake cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_lint_auto ament_lint_common mvsim teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
