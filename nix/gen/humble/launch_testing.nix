{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_xml,
  launch_yaml,
  osrf_pycommon,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch_testing = substituteSource {
      src = fetchgit {
        name = "launch_testing-source";
        url = "https://github.com/ros2-gbp/launch-release.git";
        rev = "8d8896d5a0996f4534dcb4ccb4b933f47184952d";
        hash = "sha256-0KSPLLOQUwEOTKvrQHT5HM7AigAwieONmoDTcGO7JJs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "1.0.6-1";
  src = sources.launch_testing;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
