{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_dynamic_typesupport = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "70dab9cf502cf1a82ece53378b8274c037f794e4";
        hash = "sha256-rT1266R/YhvnAKRz8sMm9JSxy5aKMhPzU711xGVKL/c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_dynamic_typesupport";
  version = "0.0.5-1";
  src = sources.rosidl_dynamic_typesupport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_ros ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_runtime_c ];
}
