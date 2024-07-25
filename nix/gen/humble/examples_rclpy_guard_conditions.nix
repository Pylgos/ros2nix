{
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
    examples_rclpy_guard_conditions = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_guard_conditions-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "845b444c0a76d4f2d60225f4689410d68986ff07";
        hash = "sha256-HEAm7jj9mLIwutmfaBtaW8q9ScDEshtr56iwDSQtST4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_guard_conditions";
  version = "0.15.1-1";
  src = sources.examples_rclpy_guard_conditions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
