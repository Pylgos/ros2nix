{
  ament_cmake,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    schunk_svh_library = substituteSource {
      src = fetchgit {
        name = "schunk_svh_library-source";
        url = "https://github.com/ros2-gbp/schunk_svh_library-release.git";
        rev = "eb88f49a96664c56f57002f2564ab41a961d28e5";
        hash = "sha256-n1ECtIIlm0bPzlzsul/AH8CHSn5tXYbNJqbiCC9AuSs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "schunk_svh_library";
  version = "1.0.1-1";
  src = sources.schunk_svh_library;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
