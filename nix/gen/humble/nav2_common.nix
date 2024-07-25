{
  ament_cmake_core,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  osrf_pycommon,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    nav2_common = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "a5bb5502567d5cb1aab4beae69813ef5010c5bfa";
        hash = "sha256-PSi5ub/2UV4bL/xTPmHR34BClRhmGujydMbTfHLjKlY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_common";
  version = "1.1.15-1";
  src = sources.nav2_common;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_python launch osrf_pycommon buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
