{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    slider_publisher = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "8533c33af1f79921beef7582d9170fa83dfdeca5";
        hash = "sha256-t3ye55W5XqkQUd/eAabhQKJUazIAi3ly0BsO7vpuHu4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slider_publisher";
  version = "2.3.1-1";
  src = sources.slider_publisher;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.scipy rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
