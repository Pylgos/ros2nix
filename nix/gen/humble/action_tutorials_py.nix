{
  action_tutorials_interfaces,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    action_tutorials_py = substituteSource {
      src = fetchgit {
        name = "action_tutorials_py-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9e017bb31878ee00f06248aeb745016546b35941";
        hash = "sha256-bUvcdRoGEw5YrRaj2TCP5mmpIBGMcZOZDZ/3B1IJPHg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "action_tutorials_py";
  version = "0.20.4-1";
  src = sources.action_tutorials_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_tutorials_interfaces rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
