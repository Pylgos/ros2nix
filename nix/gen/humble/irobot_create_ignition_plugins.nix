{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
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
    irobot_create_ignition_plugins = substituteSource {
      src = fetchgit {
        name = "irobot_create_ignition_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "e77a9379a76de9d670509144c93b97c34047628d";
        hash = "sha256-SYK7D5LV02eVcDUL+2zNsdFMEnO6LsrR8RE+1Nb7Z7U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_ignition_plugins";
  version = "2.1.0-1";
  src = sources.irobot_create_ignition_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
