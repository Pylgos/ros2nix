{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rmw_cyclonedds_cpp,
  ros2cli,
  substituteSource,
  wireguard-tools,
}:
let
  sources = rec {
    fogros2 = substituteSource {
      src = fetchgit {
        name = "fogros2-source";
        url = "https://github.com/ros2-gbp/fogros2-release.git";
        rev = "191da6cc078839f53ac2ee050d0f0aacd8880462";
        hash = "sha256-8WRsRqu8vU//YKjO6e6Rp8jC8DfGUddnsr4Gj8wAqeA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fogros2";
  version = "0.1.7-1";
  src = sources.fogros2;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boto3 python3Packages.paramiko rmw_cyclonedds_cpp ros2cli wireguard-tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
