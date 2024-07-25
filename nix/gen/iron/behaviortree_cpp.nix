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
        rev = "8a99d5f5a3f3888eff6194d81475dc50b3ab742d";
        hash = "sha256-/wi43gC6qhFEXVP2DkkASIWNXY1t6kLMoiG+KaDm7DY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp";
  version = "4.6.2-1";
  src = sources.behaviortree_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq rclcpp sqlite ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
