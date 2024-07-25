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
        rev = "5aff5371541a94c09f5b66c81d643251d95655c7";
        hash = "sha256-NAPdEdzEnQVWX5dFlwSPFMTRPudKWElParBw9p6dKck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_py";
  version = "0.25.7-1";
  src = sources.tf2_py;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
