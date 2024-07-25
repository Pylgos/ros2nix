{
  ament_cmake_core,
  ament_package,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ros_workspace = substituteSource {
      src = fetchgit {
        name = "ros_workspace-source";
        url = "https://github.com/ros2-gbp/ros_workspace-release.git";
        rev = "064bfd7175373790ec372bcaa762141121c71e53";
        hash = "sha256-+tYPQJjQzjD0UJKtZroIo9VzvGZ6Up1hzFfYxxQKiy0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_workspace";
  version = "1.0.3-4";
  src = sources.ros_workspace;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_package ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}