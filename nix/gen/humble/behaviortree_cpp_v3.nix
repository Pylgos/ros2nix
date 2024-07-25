{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  cppzmq,
  fetchgit,
  fetchurl,
  fetchzip,
  ncurses,
  rclcpp,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    behaviortree_cpp_v3 = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp_v3-source";
        url = "https://github.com/BehaviorTree/behaviortree_cpp_v3-release.git";
        rev = "6aa9eb658db2d0f95cce1a8bc1166d857db993f8";
        hash = "sha256-Ad2ITOFv5JMfXEtQOzN4S4pw+zuUGBQ2ROlHj/poywM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
          to = "URL ${behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0}";
        }
      ];
    };
    behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0 = substituteSource {
      src = fetchzip {
        name = "behaviortree_cpp_v3-vendor_source-609281088cfefc76f9d0ce82e1ff6c30cc3591e5-0-source";
        url = "https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip";
        hash = "sha256-P8l4pv8z1n/XUBYpdpLumX8VTnzO+AvBLg+8wD4+ldg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "behaviortree_cpp_v3";
  version = "3.8.7-1";
  src = sources.behaviortree_cpp_v3;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_cpp ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppzmq ncurses rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
