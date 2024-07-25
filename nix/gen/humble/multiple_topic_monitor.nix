{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    multiple_topic_monitor = substituteSource {
      src = fetchgit {
        name = "multiple_topic_monitor-source";
        url = "https://github.com/ros2-gbp/multiple_topic_monitor-release.git";
        rev = "1509e606e62b235979e45761f84589216d2ed604";
        hash = "sha256-Zv86qF0YjIbcdTqvk8N3/LkRnZu2iMlKFJ8ATRfVZQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "multiple_topic_monitor";
  version = "1.0.2-1";
  src = sources.multiple_topic_monitor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
