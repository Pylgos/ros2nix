{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    rtabmap_python = substituteSource {
      src = fetchgit {
        name = "rtabmap_python-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "ccf8e8c2677825cec626f5e314a6cd99e3c4ad03";
        hash = "sha256-BAkiOWJxqmytuyxSALt33GudRjNjfpI3j3J7DPMDkGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_python";
  version = "0.21.5-1";
  src = sources.rtabmap_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
