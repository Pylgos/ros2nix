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
        rev = "620a2b8a7c77a6dd2f0e8ec7183e41d4063e10a8";
        hash = "sha256-+tYPQJjQzjD0UJKtZroIo9VzvGZ6Up1hzFfYxxQKiy0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_workspace";
  version = "1.0.3-5";
  src = sources.ros_workspace;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_package ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}