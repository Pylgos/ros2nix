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
        rev = "b49b42823cbec02b769776ac817254f5fb1e672a";
        hash = "sha256-Rc2yKMEdJqy1SiPfAOPUs4YCDVvsvYAY3M8Ggn5/WoE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_task";
  version = "2.1.8-1";
  src = sources.rmf_task;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rmf_battery rmf_utils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
