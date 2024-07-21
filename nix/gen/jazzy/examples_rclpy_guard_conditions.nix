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
        rev = "8e9f8d35826ef49362df7a763dd229f27d3b651a";
        hash = "sha256-XuoPymroDyoXWYabkwprlEVdOyalu5DjW759xyQjsPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_guard_conditions";
  version = "0.19.4-1";
  src = sources.examples_rclpy_guard_conditions;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}