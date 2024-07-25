{
  ament_clang_format,
  ament_clang_tidy,
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  substituteSource,
  tf2_eigen,
}:
let
  sources = rec {
    affordance_primitives = substituteSource {
      src = fetchgit {
        name = "affordance_primitives-source";
        url = "https://github.com/PickNikRobotics/affordance_primitives-release.git";
        rev = "4314af7d9f5595083ea8dc9b1ad7e597d034c67b";
        hash = "sha256-GqEFF/3Ttnk78/fLYfjHlvn3mctvgNnkhS/qTJK/KTM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "affordance_primitives";
  version = "0.1.0-3";
  src = sources.affordance_primitives;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs tf2_eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
