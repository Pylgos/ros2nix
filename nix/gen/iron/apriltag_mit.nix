{
  buildRosPackage,
  clang,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    apriltag_mit = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "08b5e6247301823df6200cea6dc780d624afbd89";
        hash = "sha256-Zi02VV/uMePCSwwgpp784rW/7HiEP+yt/ZpgRFEbOFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_mit";
  version = "1.2.2-1";
  src = sources.apriltag_mit;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ clang ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen opencv python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
