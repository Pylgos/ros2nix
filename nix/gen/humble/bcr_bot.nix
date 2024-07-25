{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    bcr_bot = substituteSource {
      src = fetchgit {
        name = "bcr_bot-source";
        url = "https://github.com/blackcoffeerobotics/bcr_bot_ros2-release.git";
        rev = "c25b4fd4d7873b066aaed03516792d7bbe741bf2";
        hash = "sha256-sGPeKJ8KQtniieDLCiRQlupx8NxQKHg+Y/yWzSeut/E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bcr_bot";
  version = "1.0.2-2";
  src = sources.bcr_bot;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_index_python launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
