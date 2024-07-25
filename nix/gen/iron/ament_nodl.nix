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
    ament_nodl = substituteSource {
      src = fetchgit {
        name = "ament_nodl-source";
        url = "https://github.com/ros2-gbp/ament_nodl-release.git";
        rev = "2db8acd0c849d21cf6398ed825808d40af8154a2";
        hash = "sha256-9azhFZrnSaHJiIRFdPiDTiDO3j2v3eKxQBNdAEFwd5A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_nodl";
  version = "0.1.0-6";
  src = sources.ament_nodl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
