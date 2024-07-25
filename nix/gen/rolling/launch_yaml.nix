{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch_yaml = substituteSource {
      src = fetchgit {
        name = "launch_yaml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "dfbb994df2be78a06b629c17aa47714b7370a820";
        hash = "sha256-/MlYFNjUSgyw5Hr2QbBPtlGyBsG4zcLpcnPK3zHroI4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_yaml";
  version = "3.6.0-1";
  src = sources.launch_yaml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
