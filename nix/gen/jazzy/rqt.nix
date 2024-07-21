{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui,
  rqt_gui_cpp,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
}:
let
  sources = rec {
    rqt = substituteSource {
      src = fetchgit {
        name = "rqt-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "74f9483352ef59abf5b390f088660c02914ee74f";
        hash = "sha256-peBv6HLShNFar0fL+NpWuVKsiVpkVkHzSejtvm5eYg4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt";
  version = "1.6.0-2";
  src = sources.rqt;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rqt_gui rqt_gui_cpp rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
