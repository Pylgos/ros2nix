{
  ament_copyright,
  ament_flake8,
  ament_mypy,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    tracetools_read = substituteSource {
      src = fetchgit {
        name = "tracetools_read-source";
        url = "https://github.com/ros2-gbp/ros2_tracing-release.git";
        rev = "6d88f82433540a3be565cf90cbfd073c54a99d79";
        hash = "sha256-69iYDs3AGuoKLuuK1787ADk44qKdjtml0iqe5Bxqy6E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tracetools_read";
  version = "4.1.1-1";
  src = sources.tracetools_read;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
