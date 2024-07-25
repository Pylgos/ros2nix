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
        rev = "16cdf330d31afba9561b947ff436bcaca3f3a3f1";
        hash = "sha256-40oI5b8JZvu+v59HOBRFmuUV/m9J8N+hBFi5QOR8fcM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_xml";
  version = "2.0.4-1";
  src = sources.launch_xml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
