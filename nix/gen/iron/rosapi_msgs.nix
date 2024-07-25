{
  ament_cmake_ros,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosapi_msgs = substituteSource {
      src = fetchgit {
        name = "rosapi_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "baf02ca1bad14522dd07f1d09f3f5a3560f124bc";
        hash = "sha256-mS6s9obrtPJQkYEJluig+KM2GqAKwG2QSBz9iGCJMtc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosapi_msgs";
  version = "1.3.2-1";
  src = sources.rosapi_msgs;
  nativeBuildInputs = [ ament_cmake_ros rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rcl_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
