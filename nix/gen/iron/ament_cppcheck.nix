{
  buildRosPackage,
  cppcheck,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cppcheck = substituteSource {
      src = fetchgit {
        name = "ament_cppcheck-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a0a64ba7fff342eda35e5d150311a598bbf898f2";
        hash = "sha256-sqJyTDRDoT/+gbsv8NY7OjhbNPE9twyS6gjgg+cYMlM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cppcheck";
  version = "0.14.3-1";
  src = sources.ament_cppcheck;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cppcheck ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cppcheck ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
