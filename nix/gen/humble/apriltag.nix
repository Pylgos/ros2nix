{
  buildPackages,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3,
  substituteSource,
}:
let
  sources = rec {
    apriltag = substituteSource {
      src = fetchgit {
        name = "apriltag-source";
        url = "https://github.com/ros2-gbp/apriltag-release.git";
        rev = "d727b19d7e381c03d20aa0399595b2e697b1ea34";
        hash = "sha256-gh98hPfxaAHqN4iEbnlYrBGpiD9urWJSo4Qg5OZgfgE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag";
  version = "3.4.2-1";
  src = sources.apriltag;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ python3 buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
