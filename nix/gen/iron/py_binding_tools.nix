{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  pybind11_vendor,
  rclcpp,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    py_binding_tools = substituteSource {
      src = fetchgit {
        name = "py_binding_tools-source";
        url = "https://github.com/ros-gbp/py_binding_tools-release.git";
        rev = "c07ce50101f7b7012581a5c4ebad4805ec097ba9";
        hash = "sha256-cLKC035rnQgXR9VanE59CX4qYEvBcNuUHLgDPLDuLxQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "py_binding_tools";
  version = "2.0.0-1";
  src = sources.py_binding_tools;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs pybind11_vendor rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
