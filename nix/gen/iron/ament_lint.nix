{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_lint = substituteSource {
      src = fetchgit {
        name = "ament_lint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d5c4e8e1b61bb4ee0facec1cd58ccc51a5d0c9f2";
        hash = "sha256-0HlgY86KTklVUgG6f6TvIhFDYJLkuno3+Hmfkwvv2oc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint";
  version = "0.14.3-1";
  src = sources.ament_lint;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
