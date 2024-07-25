{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_download = substituteSource {
      src = fetchgit {
        name = "ament_download-source";
        url = "https://github.com/ros2-gbp/ament_download-release.git";
        rev = "335f895b2f76f469d2a1488de3c21bdd7c528412";
        hash = "sha256-6V9DhJraMIbNz3xeSeczpOFyaWgBqKsz2vQV4jFl6qk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_download";
  version = "0.0.5-5";
  src = sources.ament_download;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
