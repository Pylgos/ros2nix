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
  substituteSource,
}:
let
  sources = rec {
    rpyutils = substituteSource {
      src = fetchgit {
        name = "rpyutils-source";
        url = "https://github.com/ros2-gbp/rpyutils-release.git";
        rev = "91a4d03c629492cce0bcdaedb795cfc323539db2";
        hash = "sha256-naAtXDCnR8hZ6wKi3ynLr8+fLh/JYUbXfSEFa9H0+5E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rpyutils";
  version = "0.3.2-3";
  src = sources.rpyutils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
