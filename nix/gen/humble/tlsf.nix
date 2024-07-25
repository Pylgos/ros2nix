{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    tlsf = substituteSource {
      src = fetchgit {
        name = "tlsf-source";
        url = "https://github.com/ros2-gbp/tlsf-release.git";
        rev = "77ce2b324b10579e8c09875b3da7de51811693ef";
        hash = "sha256-Gaa53l1Yew9zgTyLFtPie+iQ4w68RsHQ1lJQhVNX6EI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf";
  version = "0.7.0-2";
  src = sources.tlsf;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
