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
  gz_plugin_vendor,
  gz_sim_vendor,
  substituteSource,
}:
let
  sources = rec {
    leo_gz_plugins = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "f8a8026d4d76621ccf33b1f573f1de3e16dac872";
        hash = "sha256-ga6r0cJy5q52i+zHX5Xo5GGXCKsEWC34Gu3hMMr29FU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_gz_plugins";
  version = "2.0.0-1";
  src = sources.leo_gz_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_plugin_vendor gz_sim_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
