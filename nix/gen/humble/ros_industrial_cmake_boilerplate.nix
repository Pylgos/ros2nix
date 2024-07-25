{
  buildRosPackage,
  clang,
  cmake,
  cppcheck,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  include-what-you-use,
  lcov,
  substituteSource,
}:
let
  sources = rec {
    ros_industrial_cmake_boilerplate = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "35398618a1d0516c78e430b82eae0ac778c7d64e";
        hash = "sha256-rNr5ptlVmpZBVnjrfrX2w0kU2Evi+PxLWKfvzffxTnY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.4.0-1";
  src = sources.ros_industrial_cmake_boilerplate;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
