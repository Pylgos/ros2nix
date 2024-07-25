{
  action_tutorials_interfaces,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_py = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "c299e67a003c03f47683d728072b6948f061331a";
        hash = "sha256-J8z8EwJP0kYLBMaQjT/05GCctthXOQCRCTxBSIY9nBk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_py";
  version = "0.34.1-1";
  src = sources.action_tutorials_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
