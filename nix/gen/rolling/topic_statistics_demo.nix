{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rcutils,
  sensor_msgs,
  statistics_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_statistics_demo = substituteSource {
      src = fetchgit {
        name = "topic_statistics_demo-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "dc157f05d3ed517395b7c0d2754888f6ee9cae12";
        hash = "sha256-cx3RwW/ZSdC1NJ9/jDmMZDjfsqgdrzT4INgD8LjqRaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_statistics_demo";
  version = "0.34.1-1";
  src = sources.topic_statistics_demo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rcutils sensor_msgs statistics_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
