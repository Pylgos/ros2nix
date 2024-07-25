{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rc_reason_msgs,
  rclpy,
  ros2pkg,
  substituteSource,
  tf2_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rc_reason_clients = substituteSource {
      src = fetchgit {
        name = "rc_reason_clients-source";
        url = "https://github.com/ros2-gbp/rc_reason_clients-release.git";
        rev = "3d8069b04ac130995d97abb2275fec9702f0313f";
        hash = "sha256-nrDAYPBtkbSi1QAZJHR9jYhMnPLwemNMDxIzccehO1o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rc_reason_clients";
  version = "0.3.1-1";
  src = sources.rc_reason_clients;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.requests rc_reason_msgs rclpy ros2pkg tf2_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
