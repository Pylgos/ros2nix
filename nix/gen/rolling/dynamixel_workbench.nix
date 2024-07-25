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
        rev = "fef071f094aa45e3d6f7768dcd97e7ef226da19e";
        hash = "sha256-iA1/c6eRcHNi0wnJhwog1K7jH1fKwsqIvSfgCZivKrc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench";
  version = "2.2.3-4";
  src = sources.dynamixel_workbench;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_workbench_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
