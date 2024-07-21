{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  sqlite,
  substituteSource,
}:
let
  sources = rec {
    behaviortree_cpp = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp_v4-release.git";
        rev = "d15330b9c1102ffff4dd21d68486f2e2b55e6f97";
        hash = "sha256-r9luPk1rJ4aHaMYIisJFcgiJzfuszFgKQWmOn4TiAG8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp";
  version = "4.6.1-1";
  src = sources.behaviortree_cpp;
  nativeBuildInputs = [ ament_cmake ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp cppzmq rclcpp sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
