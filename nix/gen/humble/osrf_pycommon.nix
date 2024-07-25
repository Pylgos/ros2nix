{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    osrf_pycommon = substituteSource {
      src = fetchgit {
        name = "osrf_pycommon-source";
        url = "https://github.com/ros2-gbp/osrf_pycommon-release.git";
        rev = "fcbcc7841de50998987e5caf5624b9877019f770";
        hash = "sha256-kVQSBsFUCtISe18IP7gpVCUslVT+OpJa7fQbSaENw1Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_pycommon";
  version = "2.0.2-2";
  src = sources.osrf_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.importlib-metadata ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
