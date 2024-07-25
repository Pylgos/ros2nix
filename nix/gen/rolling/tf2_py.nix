{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python_cmake_module,
  rclpy,
  rpyutils,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_py = substituteSource {
      src = fetchgit {
        name = "tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "11447cc871a8cf6743717adf4f8a8a3b265f28c0";
        hash = "sha256-hYk/BcVuwLlJ67wOwFC3hm2A/wccBRkqP7WBAy2UMcI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_py";
  version = "0.38.0-1";
  src = sources.tf2_py;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy rpyutils tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
