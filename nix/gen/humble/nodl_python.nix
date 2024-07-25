{
  ament_flake8,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    nodl_python = substituteSource {
      src = fetchgit {
        name = "nodl_python-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "ba0378ae4a2c0c9ae5fcad598984e06497652e5e";
        hash = "sha256-rHEAtKnNTsXSB1UGfZYRfy3DQXrnGFWNntTfJyxEymc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nodl_python";
  version = "0.3.1-3";
  src = sources.nodl_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.lxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
