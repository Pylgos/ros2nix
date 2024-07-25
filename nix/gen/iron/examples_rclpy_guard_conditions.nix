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
        rev = "120ff23450f4306f7fd05363020b92a1139ceb2b";
        hash = "sha256-TSaRXLyPlsLD+CrJmU17rHz0arQz1xceerHtB1xPgQ8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_guard_conditions";
  version = "0.18.0-2";
  src = sources.examples_rclpy_guard_conditions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
