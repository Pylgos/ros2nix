{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    tf2_eigen = substituteSource {
      src = fetchgit {
        name = "tf2_eigen-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "f849fb4bdf2342cae58da01a1d18241fbff80a16";
        hash = "sha256-p7fHDJeqLoENhJvloOAsROw+jd584GAJ2HJeJK7CNA8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen";
  version = "0.38.0-1";
  src = sources.tf2_eigen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
