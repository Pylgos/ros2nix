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
    marti_can_msgs = substituteSource {
      src = fetchgit {
        name = "marti_can_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "cf4d3448775d017db25aed3f058a279620e49c8e";
        hash = "sha256-SXOyPmMtRuzNSPclfR5SXtJwdCKxJdRwVXnMk5X0/Sc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_can_msgs";
  version = "1.5.2-1";
  src = sources.marti_can_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
