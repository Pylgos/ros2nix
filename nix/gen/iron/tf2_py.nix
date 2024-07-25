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
        rev = "313fb2d5b51b9f83ad1d18888ebeb044228493cb";
        hash = "sha256-Rt1WYLYRTBxC+iSrLleVoNOaoan/7Zfq7/yZnrJqGGg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_py";
  version = "0.31.7-1";
  src = sources.tf2_py;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [ rpyutils ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rclpy tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
