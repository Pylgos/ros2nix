{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_battery,
  rmf_utils,
  substituteSource,
}:
let
  sources = rec {
    rmf_task = substituteSource {
      src = fetchgit {
        name = "rmf_task-source";
        url = "https://github.com/ros2-gbp/rmf_task-release.git";
        rev = "aa9a878caa2aee2ccd50e67d8006a7a4041f6cdd";
        hash = "sha256-QtvIvYcgB7bWtCUG0zfqosTytsGGLyjlc6xW5FVLHNw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task";
  version = "2.2.5-1";
  src = sources.rmf_task;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_battery rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
