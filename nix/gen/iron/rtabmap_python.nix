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
        rev = "4b44642021079b9a1b61382290e58ce40164a1f9";
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
