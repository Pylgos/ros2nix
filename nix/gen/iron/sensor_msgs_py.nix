{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sensor_msgs_py = substituteSource {
      src = fetchgit {
        name = "sensor_msgs_py-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "832b11ad6bd7f9f33767ac8dd95074fa990c09b9";
        hash = "sha256-hpDwmsiY+3zUXMEIm+TD7iQXotkkH8e5YpeHixoklbU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sensor_msgs_py";
  version = "5.0.1-1";
  src = sources.sensor_msgs_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
