{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    steering_functions = substituteSource {
      src = fetchgit {
        name = "steering_functions-source";
        url = "https://github.com/ros2-gbp/steering_functions-release.git";
        rev = "05e72666baa1c3d11f9245f7a53be1209ff8901d";
        hash = "sha256-pU2fKTdPvxp9CHgQpy478rFkO/GvfwD54b2lnQlOAcE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "steering_functions";
  version = "0.3.0-1";
  src = sources.steering_functions;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
