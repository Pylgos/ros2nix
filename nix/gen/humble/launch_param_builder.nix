{
  ament_copyright,
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    launch_param_builder = substituteSource {
      src = fetchgit {
        name = "launch_param_builder-source";
        url = "https://github.com/ros2-gbp/launch_param_builder-release.git";
        rev = "2fc753ad0e1019842dd8a41cad0b92e56658e7c7";
        hash = "sha256-5wzPO7Vg6sA7heEmRxiLcDbilS5YyieLi8fBrtcJe/g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_param_builder";
  version = "0.1.1-1";
  src = sources.launch_param_builder;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
