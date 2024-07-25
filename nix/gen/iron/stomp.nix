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
        rev = "dceb8ac37e4c8a5cbbea1e7ede7261695c8c7a01";
        hash = "sha256-SMIxIQFBhVkKNSvnxdsAWw5pg4rc6p5xSsSck1Ig4Y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stomp";
  version = "0.1.2-3";
  src = sources.stomp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge eigen ros_industrial_cmake_boilerplate ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
