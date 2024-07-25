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
        rev = "afd20470e21b358c2cb312f397a8b3752863c62b";
        hash = "sha256-KwcRXG/x1mAisXsGttTMwMhubmlHXgcbcb5Jxhirxgo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_onboard";
  version = "3.0.2-1";
  src = sources.flexbe_onboard;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_states launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
