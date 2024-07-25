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
        rev = "66d56ebd423a2f96b2f4ec556cc693b92ffed73b";
        hash = "sha256-I6HAxyMmKupehrQfThteauhJx9N9gyw7knURaqjHvYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_simple_commander";
  version = "1.2.9-1";
  src = sources.nav2_simple_commander;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs geometry_msgs lifecycle_msgs nav2_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
