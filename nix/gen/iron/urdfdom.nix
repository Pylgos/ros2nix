{
  buildRosPackage,
  cmake,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  substituteSource,
  tinyxml,
  tinyxml_vendor,
  urdfdom_headers,
}:
let
  sources = rec {
    urdfdom = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "c08371109ac1bd53fe9cb31364977962e65aba2e";
        hash = "sha256-5KRRiDldIIZKIxyogJJVgYt4ePZfaa23RXekHhB0XOg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom";
  version = "3.1.1-2";
  src = sources.urdfdom;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor tinyxml tinyxml_vendor urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
