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
        rev = "567437c3c903fcae6147c52e0329a3865b368622";
        hash = "sha256-sxVdcnfeWev4cud30O/j5tdvD3D7mwa8pzBWlIHr5kA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "3.6.0-1";
  src = sources.launch_testing;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
