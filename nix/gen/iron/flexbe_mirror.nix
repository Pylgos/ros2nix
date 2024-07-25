{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_mirror = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "623efe1b590f766f0610858da651b851953a3bd7";
        hash = "sha256-kTc6tBecma8WzvWSM9TR4WR96CV1vSpNJqnrGAGaRDQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_mirror";
  version = "3.0.2-1";
  src = sources.flexbe_mirror;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
