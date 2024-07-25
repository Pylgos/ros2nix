{
  ament_cmake,
  buildRosPackage,
  dynamixel_workbench_toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_workbench = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "079ead58a3e69c012a7a78ae660f7a9606f95d83";
        hash = "sha256-iA1/c6eRcHNi0wnJhwog1K7jH1fKwsqIvSfgCZivKrc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench";
  version = "2.2.3-1";
  src = sources.dynamixel_workbench;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_workbench_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
