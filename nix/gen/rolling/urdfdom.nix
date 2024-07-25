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
  tinyxml-2,
  tinyxml2_vendor,
  urdfdom_headers,
}:
let
  sources = rec {
    urdfdom = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "219e7797dce15141726018c46fc5e22c4b49a23a";
        hash = "sha256-g0ad4Vg+l8H2Pv4suUdF6WseUIeSWbeHIXY+Z5il3hc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom";
  version = "4.0.0-2";
  src = sources.urdfdom;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor tinyxml-2 tinyxml2_vendor urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}