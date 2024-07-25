{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_pycommon = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "6ade9564debbad498d29896059922bda0b7d71c7";
        hash = "sha256-4PgZ5I4Lv6KPqUx5kUiugOnWRBiIwd8iA+6JG3wBb2Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.0.1-1";
  src = sources.rosidl_pycommon;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
