{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nao_lola_command_msgs = substituteSource {
      src = fetchgit {
        name = "nao_lola_command_msgs-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "bee52f8cf556d8d71ae7eaa5020654e986e6f8e0";
        hash = "sha256-IndgGzImBnJw0rE9ABJUpaTnide4Sgyo0iQGNQ2MAC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_command_msgs";
  version = "1.3.0-2";
  src = sources.nao_lola_command_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}