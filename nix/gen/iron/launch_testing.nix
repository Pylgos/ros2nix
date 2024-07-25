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
        rev = "f258dd3b11fb483038a5efa5116066ef0abe1f8c";
        hash = "sha256-WL5c4h0ta9GL1GvMxGlDolagNmLeBGtTNHaKCnsKl5g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing";
  version = "2.0.4-1";
  src = sources.launch_testing;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_xml launch_yaml osrf_pycommon python3Packages.pytest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
