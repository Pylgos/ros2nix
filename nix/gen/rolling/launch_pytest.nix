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
        rev = "bc0aede27361bb76e253a6566d976d2be8d9633b";
        hash = "sha256-X9qceDzhObUKCO43l1ScldgcFmfPlnW233wprc1AnaI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_pytest";
  version = "3.6.0-1";
  src = sources.launch_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_testing osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
