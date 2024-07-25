{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    example_interfaces = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "0840dfbb4c42492c24f55125091b3d26acfefc80";
        hash = "sha256-j+xGvGHmJOgzToHkOkJXgMjWbc/bOvJeYsAAfqGtagk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "example_interfaces";
  version = "0.10.2-4";
  src = sources.example_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
