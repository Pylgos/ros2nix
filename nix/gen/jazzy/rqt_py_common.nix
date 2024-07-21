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
}:
let
  sources = rec {
    rqt_py_common = substituteSource {
      src = fetchgit {
        name = "rqt_py_common-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "80e2f847182d27477df1159a9022413c4fcfd186";
        hash = "sha256-H/iAtFmK7PVUTchMY43rrjinZ8FP5i2yivXA4MCdqZQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_py_common";
  version = "1.6.0-2";
  src = sources.rqt_py_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt5.qtbase qt_gui rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
