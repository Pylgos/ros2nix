{
  ament_cmake,
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
    marti_status_msgs = substituteSource {
      src = fetchgit {
        name = "marti_status_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "3dd8ed6514af924aef8c4ea2009c1df530f6c627";
        hash = "sha256-H0OZx2auL2+GA25U5LCch9035IPk6AjvN3KCUFmT+1k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_status_msgs";
  version = "1.5.2-1";
  src = sources.marti_status_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
