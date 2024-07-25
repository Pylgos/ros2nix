{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs_py = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "fd2bd56232f069feb0ec752d43b8758cc5d16821";
        hash = "sha256-5PkSNbCvRpNTj6l6YY5e1OhccVnA+ieW2UvEkLdqkyg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs_py";
  version = "4.2.4-1";
  src = sources.sensor_msgs_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
