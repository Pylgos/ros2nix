{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ros_environment = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "502b8ab6793bffff5f6365f8bf494db4fcdc271f";
        hash = "sha256-BqheA0sG9VjlT2Z/vATw/yvKZy4eY9SfexvYFjkQx7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_environment";
  version = "4.1.1-1";
  src = sources.ros_environment;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
