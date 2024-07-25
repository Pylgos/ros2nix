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
        rev = "226b364efbf26aa67256c5ba54939189993839fd";
        hash = "sha256-hBYhTwMcGodOFy46yEOLnf54jjn3XGMh2DssZjI54wc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_states";
  version = "2.3.5-1";
  src = sources.flexbe_states;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_testing rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
