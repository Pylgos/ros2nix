{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lifecycle_msgs,
  nav2_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    nav2_simple_commander = substituteSource {
      src = fetchgit {
        name = "nav2_simple_commander-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9a387783b1b08dd006458c352ddcf53658005f90";
        hash = "sha256-vnxpb0JGQbQNQmZGyEB+9jNKnsjOgYu2/ewG5Ki1xvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_simple_commander";
  version = "1.1.15-1";
  src = sources.nav2_simple_commander;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs lifecycle_msgs nav2_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
