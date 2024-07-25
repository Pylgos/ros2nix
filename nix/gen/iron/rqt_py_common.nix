{
  ament_cmake,
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_cmake_module,
  python_qt_binding,
  qt5,
  qt_gui,
  rclpy,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_py_common = substituteSource {
      src = fetchgit {
        name = "rqt_py_common-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "c962939be2da761314ad3a5ac49752dad819f592";
        hash = "sha256-puOy0yYgi7SEnfIlZRVlYn9ZxcvLbb7RufjlJZMZmn4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_common";
  version = "1.3.4-1";
  src = sources.rqt_py_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt5.qtbase qt_gui rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
