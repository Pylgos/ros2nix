{
  ament_copyright,
  ament_flake8,
  ament_index_python,
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
    robot_upstart = substituteSource {
      src = fetchgit {
        name = "robot_upstart-source";
        url = "https://github.com/clearpath-gbp/robot_upstart-release.git";
        rev = "cbbf8de5f7238283507543f428ef50b87b8370c0";
        hash = "sha256-RvzQlz7Oez/M/uXqXVjwMxFIPyWgZtHcfscHDiOXMIQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_upstart";
  version = "1.0.3-1";
  src = sources.robot_upstart;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
