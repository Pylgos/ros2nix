{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  clearpath_config,
  clearpath_control,
  clearpath_description,
  clearpath_platform,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    clearpath_generator_common = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_common-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "ea2cc3f9bad3db0cc83659fe166eab8583d8e898";
        hash = "sha256-fKCA4Nm+Is7GYK26N8JdeKu0nUkVaP/1mZ6qtDwIZ5A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_generator_common";
  version = "0.2.9-1";
  src = sources.clearpath_generator_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ clearpath_config clearpath_control clearpath_description clearpath_platform ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
