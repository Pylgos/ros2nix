{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libnabo = substituteSource {
      src = fetchgit {
        name = "libnabo-source";
        url = "https://github.com/ros2-gbp/libnabo-release.git";
        rev = "6bfba358356c63e61e6e6ab1dacd541e814b52bc";
        hash = "sha256-Mgrzbissrz6FpDhNnycTc06xxw2+MpwzohUg4wBKVmI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libnabo";
  version = "1.0.7-3";
  src = sources.libnabo;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
