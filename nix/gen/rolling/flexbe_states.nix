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
  flexbe_testing,
  geometry_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_states = substituteSource {
      src = fetchgit {
        name = "flexbe_states-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "4c86a317b76c58c3b06c4e002dafd18129c20e19";
        hash = "sha256-9nCf5YRLrdFBBRGVTkMGtiBfcHoiWNVdCLwqKnaSv3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_states";
  version = "3.0.3-1";
  src = sources.flexbe_states;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_testing rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}