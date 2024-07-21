{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2action,
  ros2cli,
  ros2node,
  ros2param,
  ros2topic,
  substituteSource,
}:
let
  sources = rec {
    system_fingerprint = substituteSource {
      src = fetchgit {
        name = "system_fingerprint-source";
        url = "https://github.com/ros2-gbp/ros_system_fingerprint-release.git";
        rev = "0dd0aeb274ee7e6ecb70a2bfa77ad6d0dd0503c2";
        hash = "sha256-swG8fwjiFc0LXSlbA6Lml0jlh/VyNS//insRqM01fr0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "system_fingerprint";
  version = "0.7.0-4";
  src = sources.system_fingerprint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.GitPython rcl_interfaces rclpy ros2action ros2cli ros2node ros2param ros2topic ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}