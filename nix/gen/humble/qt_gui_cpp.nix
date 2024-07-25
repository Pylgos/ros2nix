{
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  pluginlib,
  python_qt_binding,
  qt5,
  qt_gui,
  rcpputils,
  substituteSource,
  tinyxml2_vendor,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qt_gui_cpp = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "e59f89fc5fc8fe80378847975b3aa5985aa6e197";
        hash = "sha256-tzgzoU+IVLHEWIW9H9JpsXvzsV8t3a0psGTws+eKsQo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_cpp";
  version = "2.2.3-2";
  src = sources.qt_gui_cpp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib python_qt_binding qt5.qtbase qt_gui rcpputils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
