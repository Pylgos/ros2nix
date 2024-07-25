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
        rev = "6ee173549b9d1911a99ce79bcce08dfc4be67b99";
        hash = "sha256-i0VwuoqswFc1coII78CBoR1ZGHshFFuKNQgVzS5LC/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ndt_omp";
  version = "0.0.0-1";
  src = sources.ndt_omp;
  nativeBuildInputs = [ ament_cmake_auto ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
