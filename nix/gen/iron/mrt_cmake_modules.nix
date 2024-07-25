{
  ament_cmake_core,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest_vendor,
  lcov,
  python3Packages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mrt_cmake_modules = substituteSource {
      src = fetchgit {
        name = "mrt_cmake_modules-source";
        url = "https://github.com/ros2-gbp/mrt_cmake_modules-release.git";
        rev = "27d1d00d46cd461d8c2c688fe8862ffeacccfbbc";
        hash = "sha256-PCqR+osiiGlHN0JWW6C/bhSD9H7GuzuQ4Lo8fExnOk0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrt_cmake_modules";
  version = "1.0.9-4";
  src = sources.mrt_cmake_modules;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ gtest_vendor lcov buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.pyyaml buildPackages.python3Packages.setuptools ros_environment ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ gtest_vendor lcov python3Packages.catkin-pkg python3Packages.pyyaml python3Packages.setuptools ros_environment ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
