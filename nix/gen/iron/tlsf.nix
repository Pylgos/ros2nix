{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tlsf = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "49bf3526db75cca334c9c92fa077adad7d51e80e";
        hash = "sha256-CbMbnH5vTkoQd/0+pXZ0ycWtEeUTjNr0mV9Vv5wy9XA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf";
  version = "0.8.2-3";
  src = sources.tlsf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
