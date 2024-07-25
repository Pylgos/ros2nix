{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    sdformat_test_files = substituteSource {
      src = fetchgit {
        name = "sdformat_test_files-source";
        url = "https://github.com/ros2-gbp/sdformat_urdf-release.git";
        rev = "50024610fa7de8945379263f3d7b1a84f7fc1022";
        hash = "sha256-+3nL+Njboe0apHQrf0wM7r53YuOAoG8MjCOOoyhCG1c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sdformat_test_files";
  version = "1.0.1-3";
  src = sources.sdformat_test_files;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
