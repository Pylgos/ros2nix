{
  buildPackages,
  buildRosPackage,
  cmake,
  doxygen,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    eigenpy = substituteSource {
      src = fetchgit {
        name = "eigenpy-source";
        url = "https://github.com/ros2-gbp/eigenpy-release.git";
        rev = "07d3d830d1c59813254a2f48a6756193d3ce9a45";
        hash = "sha256-i4BqdFVcCelRtI26uKC1b2kOH79EXbBltzJw3JiaL8k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "eigenpy";
  version = "3.7.0-1";
  src = sources.eigenpy;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ doxygen git buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3 python3Packages.boost python3Packages.scipy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
