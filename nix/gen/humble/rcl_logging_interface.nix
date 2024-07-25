{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcl_logging_interface = substituteSource {
      src = fetchgit {
        name = "rcl_logging_interface-source";
        url = "https://github.com/ros2-gbp/rcl_logging-release.git";
        rev = "0a993aadebdf589566ddac5e146b8270d7383e39";
        hash = "sha256-/HoV3O8tuCcWjhpSADIOGW3zKPajWVYtqZ7F2Pq3E9U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_logging_interface";
  version = "2.3.1-1";
  src = sources.rcl_logging_interface;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
