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
        rev = "d40cd255d92fb299ad8d8bcbb1d1e7ee9788b800";
        hash = "sha256-aqUY1gOO7kF2H84Q495GYSykteWnFBJKBVP7ViClmAA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2run";
  version = "0.25.6-1";
  src = sources.ros2run;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
