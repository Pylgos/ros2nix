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
    launch_xml = substituteSource {
      src = fetchgit {
        name = "launch_xml-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "3308618cbd334b6a3681d4d049f1111dfe42298f";
        hash = "sha256-ubpyiN/84VWRYSU/OS0NKQqONUdmUdHQzp3cqqLVXEI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_xml";
  version = "3.6.0-1";
  src = sources.launch_xml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
