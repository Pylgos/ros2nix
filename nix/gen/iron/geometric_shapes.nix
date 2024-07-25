{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_cmake,
  assimp,
  buildRosPackage,
  console_bridge_vendor,
  eigen,
  eigen3_cmake_module,
  eigen_stl_containers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  octomap,
  pkg-config,
  python3Packages,
  qhull,
  random_numbers,
  rclcpp,
  resource_retriever,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    geometric_shapes = substituteSource {
      src = fetchgit {
        name = "geometric_shapes-source";
        url = "https://github.com/ros2-gbp/geometric_shapes-release.git";
        rev = "7e9c7a2324a33208b4445d9bbf896222515079d3";
        hash = "sha256-Z8bt1wMFIfgQRfYat6fCd9hEKtS2qf8Wzbz+0hA+xzo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometric_shapes";
  version = "2.1.3-4";
  src = sources.geometric_shapes;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp console_bridge_vendor eigen eigen_stl_containers geometry_msgs octomap python3Packages.boost qhull random_numbers rclcpp resource_retriever rosidl_default_runtime shape_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
