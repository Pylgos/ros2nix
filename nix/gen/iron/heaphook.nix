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
        rev = "f08750cf649966485632be18057cc37ffba7510c";
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
