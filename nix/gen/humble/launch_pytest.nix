{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  osrf_pycommon,
  substituteSource,
}:
let
  sources = rec {
    launch_pytest = substituteSource {
      src = fetchgit {
        name = "launch_pytest-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "f94fae450dc678eafa55b077501afddfcc79c336";
        hash = "sha256-q/YxRLXuNV2TqhpW0RkrLlSPPAkqGJhT5vkxRAdUW3c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_pytest";
  version = "1.0.6-1";
  src = sources.launch_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_testing osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
