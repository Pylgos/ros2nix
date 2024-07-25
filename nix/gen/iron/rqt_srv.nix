{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rqt_gui,
  rqt_gui_py,
  rqt_msg,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_srv = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "5921fb198b2c8b704d56c62e0edbae85cf8d9be9";
        hash = "sha256-lvhGTykVPZU+QEdfxxGCq38+2pTlYAyn9RcSIN0XxHo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_srv";
  version = "1.1.1-3";
  src = sources.rqt_srv;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy rqt_gui rqt_gui_py rqt_msg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
