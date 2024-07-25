{
  ament_cmake_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    ndt_omp = substituteSource {
      src = fetchgit {
        name = "ndt_omp-source";
        url = "https://github.com/ros2-gbp/ndt_omp-release.git";
        rev = "62d38431e5a0e0124b4218c614aecba5b428ea2b";
        hash = "sha256-i0VwuoqswFc1coII78CBoR1ZGHshFFuKNQgVzS5LC/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ndt_omp";
  version = "0.0.0-2";
  src = sources.ndt_omp;
  nativeBuildInputs = [ ament_cmake_auto ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
