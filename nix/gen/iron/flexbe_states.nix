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
        rev = "0a5a8b6c6f6b50178527362cf2df200fab671d2d";
        hash = "sha256-uuvD4aKE99hUWBUTMP1M0qMDU4uSM7wwFu3qE0Rsmr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_states";
  version = "3.0.2-1";
  src = sources.flexbe_states;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_testing rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
