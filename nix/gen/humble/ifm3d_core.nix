{
  buildRosPackage,
  cmake,
  curl,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  glog,
  pcl,
  python3Packages,
  substituteSource,
  xmlrpc_c,
}:
let
  sources = rec {
    ifm3d_core = substituteSource {
      src = fetchgit {
        name = "ifm3d_core-source";
        url = "https://github.com/ros2-gbp/ifm3d-release.git";
        rev = "34d2f5d56f7a23db780d75b53c7133cd68e5a313";
        hash = "sha256-uR93fGa2he8/x1p8bZM2xobrFhbm7cnUGAw341qYlOE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ifm3d_core";
  version = "0.18.0-7";
  src = sources.ifm3d_core;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ curl ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge glog pcl python3Packages.boost xmlrpc_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
