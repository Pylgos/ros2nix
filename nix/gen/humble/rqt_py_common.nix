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
        rev = "8fe4b5f5500d73f7077de726d827141f5c1f662a";
        hash = "sha256-2TgKKKIOdTzriRb9SBVrlQBGK6UVtTQnNGrafuZOx3w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_common";
  version = "1.1.7-1";
  src = sources.rqt_py_common;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt5.qtbase qt_gui rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
