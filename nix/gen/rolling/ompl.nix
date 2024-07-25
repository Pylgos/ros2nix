{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  flann,
  ode,
  pkg-config,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ompl = substituteSource {
      src = fetchgit {
        name = "ompl-source";
        url = "https://github.com/ros2-gbp/ompl-release.git";
        rev = "ea5805afba66dc4ae801d9cf3a062eb6bfc03edb";
        hash = "sha256-5BOfJbZfx2T6vZS5UOpQh9XueTRPtNBGmpHauSbvUxw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ompl";
  version = "1.5.2-4";
  src = sources.ompl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen flann ode python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
