{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tlsf,
}:
let
  sources = rec {
    heaphook = substituteSource {
      src = fetchgit {
        name = "heaphook-source";
        url = "https://github.com/ros2-gbp/heaphook-release.git";
        rev = "c91c580ad1037e94ff963cac1d01272ae02b99fa";
        hash = "sha256-muNY40LV1Jqtg043Lo1oCWIqz93a3zVaQ23jgFaEOPE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "heaphook";
  version = "0.1.1-1";
  src = sources.heaphook;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tlsf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
