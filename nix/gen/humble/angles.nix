{
  ament_cmake,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    angles = substituteSource {
      src = fetchgit {
        name = "angles-source";
        url = "https://github.com/ros2-gbp/angles-release.git";
        rev = "135341e21daa76932543af10a91a7d9273da40f5";
        hash = "sha256-44NUh6CmR32yzKpcgDPoNtoEV+XCEPCfTx7OL+xUJQ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "angles";
  version = "1.15.0-1";
  src = sources.angles;
  nativeBuildInputs = [ ament_cmake_python buildPackages.python3Packages.setuptools ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
