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
        rev = "05eb57fe2f78774dbfb32f93b3814c38e715c484";
        hash = "sha256-HZUa4jeLxgK+8SLIgUaJ/3UoyQ9Y7+f4TBH8YyOfjkQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slider_publisher";
  version = "2.4.0-1";
  src = sources.slider_publisher;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.scipy rqt_gui_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
