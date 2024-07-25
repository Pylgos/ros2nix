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
        rev = "f85e87d88d70bce81e6c47e9da33fb4b01bf178d";
        hash = "sha256-SLFZqnfQmfF/5Mf3+hq8ePwMaE+e44rkrYJ62KU6+aU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rpyutils";
  version = "0.2.1-2";
  src = sources.rpyutils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
