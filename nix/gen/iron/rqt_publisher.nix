{
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python_qt_binding,
  qt_gui_py_common,
  rclpy,
  rosidl_runtime_py,
  rqt_gui,
  rqt_gui_py,
  rqt_py_common,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rqt_publisher = substituteSource {
      src = fetchgit {
        name = "rqt_publisher-source";
        url = "https://github.com/ros2-gbp/rqt_publisher-release.git";
        rev = "c1e55ed636fefe401124dcca6e6cb3d15d86ee13";
        hash = "sha256-bthu+7Xs8im9YWv0PrYjnda3x1dFwW16ELhJ9htkFPc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rqt_publisher";
  version = "1.6.3-2";
  src = sources.rqt_publisher;
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python_qt_binding qt_gui_py_common rclpy rosidl_runtime_py rqt_gui rqt_gui_py rqt_py_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
