{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    bno055 = substituteSource {
      src = fetchgit {
        name = "bno055-source";
        url = "https://github.com/ros2-gbp/bno055-release.git";
        rev = "79eb1d2e533a459f7c3a1e44301eaddb1a0f371e";
        hash = "sha256-C8wFVPMD9UXtgtXX3T4ERtwtrr1IKIwYwiGzp1XWbS4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bno055";
  version = "0.5.0-1";
  src = sources.bno055;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ example_interfaces python3Packages.pyserial rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
