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
        rev = "11e03873b5cc3303db45c9729a8c3fdc57d0d5b8";
        hash = "sha256-oKjjvQ8+9kmE/JYX1boHfRN4q52+Uk9mjH3KtVPWC1U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_dynamic_typesupport";
  version = "0.1.2-3";
  src = sources.rosidl_dynamic_typesupport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
