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
}:
let
  sources = rec {
    python_qt_binding = substituteSource {
      src = fetchgit {
        name = "python_qt_binding-source";
        url = "https://github.com/ros2-gbp/python_qt_binding-release.git";
        rev = "68ffe1fac31519713735be637c6c3280455dbc2a";
        hash = "sha256-6O8drSOVJ+eJfYkt/pqnGBJYqAulmgEjbElU4k8h68M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_qt_binding";
  version = "2.2.1-1";
  src = sources.python_qt_binding;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ qt5.qtbase ];
  propagatedBuildInputs = [ python3Packages.pyside2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
