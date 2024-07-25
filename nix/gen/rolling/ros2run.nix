{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  ros2cli,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2run = substituteSource {
      src = fetchgit {
        name = "ros2run-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "cd7a98cfb83250eefbc18ad7ba2cd483ce13630f";
        hash = "sha256-SyIbcTDx7iopXGAdBj3kQ0vCpnAWSwVA4SRe2mT9sJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2run";
  version = "0.34.0-1";
  src = sources.ros2run;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
