{
  ament_cmake_ros,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_console = substituteSource {
      src = fetchgit {
        name = "ecl_console-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "b60392671e49ee2ec0d32c68c2e96c8519483bce";
        hash = "sha256-w1XZlDsjZDQ0MPDG+dhU0mD3KZjRt4yslxJCP5RHeTE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_console";
  version = "1.2.0-1";
  src = sources.ecl_console;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
