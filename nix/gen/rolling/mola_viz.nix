{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_viz = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "d05f0dd0f24fffa6c61cf4b0bb97e92a8eb9995b";
        hash = "sha256-4e4L9w5blHlC21UCn9O2VqhwSXbnyeKCy5fSgXRRbHw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_viz";
  version = "1.0.6-1";
  src = sources.mola_viz;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_kernel mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
