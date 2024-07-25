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
        rev = "5983d19817d0c6bb3f37718b3d40ed16b273129d";
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
