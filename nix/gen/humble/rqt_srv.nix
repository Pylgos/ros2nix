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
        rev = "468338c8c97e91432b70a954f4d8531373897bc6";
        hash = "sha256-q6xLT+in38OgaER7EjAFQvGQIqlXCP85eR4andyqu8g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_srv";
  version = "1.0.3-3";
  src = sources.rqt_srv;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy rqt_gui rqt_gui_py rqt_msg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
