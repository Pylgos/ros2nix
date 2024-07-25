{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  qt5,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    python_qt_binding = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "7f687ab903a3513f6deda9b43e67b1a0edbeb97f";
        hash = "sha256-DtKuJ821tUUjTjVfhszlBKW/kLLCVB2j9VL8oF37kJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_qt_binding";
  version = "2.3.1-1";
  src = sources.python_qt_binding;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pyqt5 python3Packages.pyside2 python3Packages.sip4 qt5.qtbase ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
