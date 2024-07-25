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
  flexbe_states,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_onboard = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "e5b7692945ff50aa61bcd521be40e24fb79efd91";
        hash = "sha256-oAJBvTXjQBTbfApcOPVBhIYTilzEcSJURifbrFjYjgA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_onboard";
  version = "2.3.5-1";
  src = sources.flexbe_onboard;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_states launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
