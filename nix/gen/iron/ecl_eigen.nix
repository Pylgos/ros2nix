{
  ament_cmake_ros,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_eigen = substituteSource {
      src = fetchgit {
        name = "ecl_eigen-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "79158093f40b234085f7d070d288a3529190281d";
        hash = "sha256-tkEm2XgT3kJqdj/+L317KVB0SOyCjRKuLqsOWToPxbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_eigen";
  version = "1.2.1-4";
  src = sources.ecl_eigen;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
