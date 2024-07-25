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
        rev = "8b2075e6a9fc4dd96e1f9e1edd73a86833f07314";
        hash = "sha256-XxM2tgKfoKFeoOehb4WzdRu+TY6ETQY7soaL8/+mFBk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2run";
  version = "0.18.10-1";
  src = sources.ros2run;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
