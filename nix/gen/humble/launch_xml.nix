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
        rev = "17c11938625d1e0465ff3965fc152f4b2cd227a7";
        hash = "sha256-6DZ+xrXg2+AUnnC+SgEdeNcej+avXUKtiOG4yC3o4pM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_xml";
  version = "1.0.6-1";
  src = sources.launch_xml;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
