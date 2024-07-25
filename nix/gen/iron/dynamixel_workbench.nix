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
        rev = "f6afb5ae326336c2da2061a5482c615692f4cf6c";
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
