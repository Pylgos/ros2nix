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
        rev = "ec6361a50994c2457eb50f7983758a196cd4dcfc";
        hash = "sha256-L07zQ/Wxm3CT87T8PvIiF7ObLAEjAwjfqpxzJpV7BC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_common";
  version = "1.2.9-1";
  src = sources.nav2_common;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_python launch osrf_pycommon buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
