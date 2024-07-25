{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo,
  leo_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    leo_desktop = substituteSource {
      src = fetchgit {
        name = "leo_desktop-source";
        url = "https://github.com/ros2-gbp/leo_desktop-release.git";
        rev = "d2ca1c687554957811c18028973ab021bc71f79f";
        hash = "sha256-r7YfvqciFeNpfVMj86cT0f2M4oS0DEhYZuXsmsZxfD4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_desktop";
  version = "2.0.0-1";
  src = sources.leo_desktop;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo leo_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
