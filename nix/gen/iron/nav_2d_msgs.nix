{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav_2d_msgs = substituteSource {
      src = fetchgit {
        name = "nav_2d_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "df31cc60263c36fc6ab9f3cb8a2b08331dcca482";
        hash = "sha256-AIvUERc+/R32eXrR3iVudzSpSsogjaw4grpc7DgvtUw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_2d_msgs";
  version = "1.2.9-1";
  src = sources.nav_2d_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
