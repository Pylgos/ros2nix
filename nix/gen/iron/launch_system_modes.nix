{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  osrf_pycommon,
  python3Packages,
  rclpy,
  substituteSource,
  system_modes_msgs,
}:
let
  sources = rec {
    launch_system_modes = substituteSource {
      src = fetchgit {
        name = "launch_system_modes-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "7a8fd8100a9a4e0999a73af3c2315a16fa2ce344";
        hash = "sha256-igv7EQutLOf+qcExGB554hDDTuFxB1P9COvQUY2izGA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_system_modes";
  version = "0.9.0-5";
  src = sources.launch_system_modes;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch osrf_pycommon buildPackages.python3Packages.importlib-metadata buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy system_modes_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
