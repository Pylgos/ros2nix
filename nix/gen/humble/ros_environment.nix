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
        rev = "4ef83fcfe71d33e27fcdc4d2dbc7fbd692121b15";
        hash = "sha256-XtonGZlyFRb0OxhZIDY7WYOKJsVQrXFb74koRHjhkdg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_environment";
  version = "3.2.2-1";
  src = sources.ros_environment;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
