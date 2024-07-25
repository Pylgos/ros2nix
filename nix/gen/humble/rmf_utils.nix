{
  ament_cmake_catch2,
  ament_cmake_uncrustify,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rmf_utils = substituteSource {
      src = fetchgit {
        name = "rmf_utils-source";
        url = "https://github.com/ros2-gbp/rmf_utils-release.git";
        rev = "14873c4b5c2f4a3c2f93e47c04e9f12bc1392a8f";
        hash = "sha256-NEaeaBHvPcbXVB9tpwPVV0cnXWnKwDN8RTa2Z6gWNZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_utils";
  version = "1.4.1-1";
  src = sources.rmf_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
