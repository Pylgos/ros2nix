{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    leo_gz_plugins = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "cbff8e8e5a2bdab8781e01c13f4eec4576b9d3a1";
        hash = "sha256-ew0gTZiQGHZJB1UkZT+TiU/MR6NdQNWLCYUGVIVUFFg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_plugins";
  version = "1.1.0-1";
  src = sources.leo_gz_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
