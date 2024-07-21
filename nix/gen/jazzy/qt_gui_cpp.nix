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
  substituteSource,
  tinyxml2_vendor,
}:
let
  sources = rec {
    qt_gui_cpp = substituteSource {
      src = fetchgit {
        name = "qt_gui_cpp-source";
        url = "https://github.com/ros2-gbp/qt_gui_core-release.git";
        rev = "08b713a20f93a00a1453852534c6cf503140913b";
        hash = "sha256-MErOrE3H9r3HGOJfiShwraVUJ2mFRRNQvwroqac6QmE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qt_gui_cpp";
  version = "2.7.4-2";
  src = sources.qt_gui_cpp;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ python_qt_binding qt5.qtbase ];
  propagatedBuildInputs = [ pluginlib qt_gui tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
