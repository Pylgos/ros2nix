{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  std_msgs,
  std_srvs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosidl_runtime_py = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "45e0697efc5f7a7142456c914437654cae445946";
        hash = "sha256-GnBT4Vu+adfgHlsdHZmt8uC+LSY2FNU5HN8nopW0OSc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_py";
  version = "0.12.0-2";
  src = sources.rosidl_runtime_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
