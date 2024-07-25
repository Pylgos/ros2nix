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
    fadecandy_msgs = substituteSource {
      src = fetchgit {
        name = "fadecandy_msgs-source";
        url = "https://github.com/eurogroep/fadecandy_ros-release.git";
        rev = "d51812fa76ada17d476c8c37cd38ab72b0aa69e4";
        hash = "sha256-q95L/EMyW9mbjvgyofhXQjx5ncfeNmIt7j6FRjXEg3o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fadecandy_msgs";
  version = "1.0.2-1";
  src = sources.fadecandy_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
