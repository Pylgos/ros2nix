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
    flexbe_input = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "953d14794a4175f566e7cc23de1253b09fddfcc5";
        hash = "sha256-pPzMpRE90PP4oQ26SxWCx9yQsVLe65wZ3hCekdAyulo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_input";
  version = "2.3.5-1";
  src = sources.flexbe_input;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
