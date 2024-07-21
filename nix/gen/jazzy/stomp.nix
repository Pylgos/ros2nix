{
  buildRosPackage,
  cmake,
  console-bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  ros_industrial_cmake_boilerplate,
  substituteSource,
}:
let
  sources = rec {
    stomp = substituteSource {
      src = fetchgit {
        name = "stomp-source";
        url = "https://github.com/ros2-gbp/stomp-release.git";
        rev = "699543c259979d6b331206a37941d78cd3122b0e";
        hash = "sha256-SMIxIQFBhVkKNSvnxdsAWw5pg4rc6p5xSsSck1Ig4Y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stomp";
  version = "0.1.2-4";
  src = sources.stomp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ros_industrial_cmake_boilerplate ];
  propagatedBuildInputs = [ console-bridge eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
