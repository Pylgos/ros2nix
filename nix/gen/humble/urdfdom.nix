{
  buildRosPackage,
  cmake,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "f542c91673cb3fa3c8742164d1565a09de150c30";
        hash = "sha256-mxUV23F0tO2GutjNSB1FCaDqCRshrntM+uBBiqUZweg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom";
  version = "3.0.2-2";
  src = sources.urdfdom;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor tinyxml tinyxml_vendor urdfdom_headers ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
