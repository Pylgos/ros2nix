{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  substituteSource,
}:
let
  sources = rec {
    phidgets_api = substituteSource {
      src = fetchgit {
        name = "phidgets_api-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "3828104e6f322cce704087ba97a43eeb8918ce81";
        hash = "sha256-yApWn4EjkZOKG71s1bRI+kpC+mFXm6uJk5hROmuXNFc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_api";
  version = "2.3.3-1";
  src = sources.phidgets_api;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libphidget22 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
