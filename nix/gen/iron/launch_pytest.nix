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
        rev = "04816e144b7b3d112b0b4ebabd768bc8d358cc33";
        hash = "sha256-DP0TGyV4O2e2igmiHWxwIyu0knFAy7xkooWZMeAqMu4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_pytest";
  version = "2.0.4-1";
  src = sources.launch_pytest;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_testing osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
