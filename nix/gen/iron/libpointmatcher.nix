{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libpointmatcher = substituteSource {
      src = fetchgit {
        name = "libpointmatcher-source";
        url = "https://github.com/ros2-gbp/libpointmatcher-release.git";
        rev = "ea8d46e91d701b5a9b42478def10b734c0c68570";
        hash = "sha256-xf10qSsiwGWXJWJchOV/0eb0waEcEN9AsLTI/t9nos8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libpointmatcher";
  version = "1.3.1-5";
  src = sources.libpointmatcher;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libnabo python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
